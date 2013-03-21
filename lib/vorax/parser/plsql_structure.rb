# encoding: utf-8

require 'tree'

module Vorax

  module Parser


    class PlsqlStructure

      PLSQL_SPEC = /(?:\bpackage\b|\btype\b)/i unless defined?(PLSQL_SPEC)
      SUBPROG = /(?:\bfunction\b|\bprocedure\b)/i unless defined?(SUBPROG)
      BEGIN_MARKER = /(?:\bbegin\b)/i unless defined?(BEGIN_MARKER)
      END_MARKER = /(?:\bend\b)/i unless defined?(END_MARKER)
      FOR_STMT = /(?:\bfor\b)/i unless defined?(FOR_STMT)
      LOOP_STMT = /(?:\bloop\b)/i unless defined?(LOOP_STMT)
      IF_STMT = /(?:\bif\b)/i unless defined?(IF_STMT)

      attr_reader :text

      def initialize(text)
        @text = text
        @root = Tree::TreeNode.new("root", nil)
        @walker = PLSQLWalker.new(text)
        @level = 0
        @current_parent = @root
        @begin_level = 0
        register_spots()
        @walker.walk
      rescue Exception => e
        # be prepare for any nasting parse error.
        # Failing here is kind of usual, having in mind
        # that we often parse incomplete code.
        puts e.message
        puts e.backtrace
        Vorax.debug(e.to_s)
      end

      def tree
        @root
      end

    private

      def register_spots
        register_plsql_spec_spot()
        register_slash_terminator_spot()
        register_subprog_spot()
        register_begin_spot()
        register_for_spot()
        register_loop_spot()
        register_if_spot()
        register_end_spot()
      end

      def register_plsql_spec_spot
        @walker.register_spot(PLSQL_SPEC) do |scanner|
          if @level == 0
            meta_data = Parser.plsql_def("#{scanner.matched}#{scanner.rest}")
            if meta_data[:type] == 'SPEC'
              region = SpecRegion.new(self, :name => meta_data[:name], :start_pos => scanner.pos)
						elsif meta_data[:type] == 'BODY'
              region = BodyRegion.new(self, :name => meta_data[:name], :start_pos => scanner.pos)
						end
						assign_parent(@current_parent << Tree::TreeNode.new(region.id, region))
						@level += 1
          end
        end
      end

      def register_slash_terminator_spot
        @walker.register_spot(Parser::SLASH_TERMINATOR) do |scanner|
          # this should apply to the last top level node
          if @root.has_children?
            if @root.children.last.content
              @root.children.last.content.end_pos = scanner.pos
            end
            assign_parent(@root)
            @level = 0
          end
        end
      end

      def register_subprog_spot
        @walker.register_spot(SUBPROG) do |scanner|
          if not on_spec?
						subprog_name = scanner.peek(32)[/(?:"[^"]+")|(?:[A-Z0-9$_#]+)/i]
						start_pos = scanner.pos - scanner.matched.length
						region = SubprogRegion.new(self, :name => subprog_name, :start_pos => start_pos)
						node = Tree::TreeNode.new(region.id, region)
						@current_parent << node
						@level += 1
						assign_parent(node)
					end
        end
      end

      def register_begin_spot
        @walker.register_spot(BEGIN_MARKER) do |scanner|
          @begin_level += 1
          if @begin_level > 1
            # start a new region
            region = AnonymousRegion.new(self, :start_pos => scanner.pos)
            @level += 1
            assign_parent(@current_parent << Tree::TreeNode.new(region.id, region))
          else
          	if @current_parent && 
          		  @current_parent.content && 
          		  @current_parent.content.kind_of?(SubprogRegion)
							@current_parent.content.body_start_pos = scanner.pos - scanner.matched.length
						end
          end
        end
      end

			def register_for_spot
        @walker.register_spot(FOR_STMT) do |scanner|
					stmt = "#{scanner.matched}#{scanner.rest}"
					handler = Parser.describe_for(stmt)
					if handler[:end_pos] > 0
						start_pos = scanner.pos - scanner.matched.length + 1
						domain = handler[:expr] || handler[:cursor_var]
						if handler[:expr]
							domain_type = :expr
						elsif handler[:cursor_var]
							domain_type = :cursor
						else
							domain_type = :counter
						end
						region = ForRegion.new(self, 
																	 :start_pos => start_pos,
																	 :variable => handler[:for_var],
																	 :domain => domain,
																	 :domain_type => domain_type)
            assign_parent(@current_parent << Tree::TreeNode.new(region.id, region))
						scanner.pos = start_pos + handler[:end_pos]
						@level += 1
					end
				end
			end

			def register_loop_spot
        @walker.register_spot(LOOP_STMT) do |scanner|
					stmt = "#{scanner.matched}#{scanner.rest}"
					region = LoopRegion.new(self, :start_pos => scanner.pos - scanner.matched.length + 1)
					assign_parent(@current_parent << Tree::TreeNode.new(region.id, region))
					@level += 1
				end
			end

			def register_if_spot
        @walker.register_spot(IF_STMT) do |scanner|
					stmt = "#{scanner.matched}#{scanner.rest}"
					region = IfRegion.new(self, :start_pos => scanner.pos - scanner.matched.length + 1)
					assign_parent(@current_parent << Tree::TreeNode.new(region.id, region))
					@level += 1
				end
			end

      def register_end_spot
        @walker.register_spot(END_MARKER) do |scanner|
          # we have an "end" match. first of all check if it's not part
          # of an conditional compiling "$end" definition
          char_behind = scanner.string[scanner.pos - scanner.matched.length - 1, 1]
          if char_behind != '$'
            metadata = Parser.plsql_def("#{scanner.matched}#{scanner.rest}")
						if metadata[:end_def] > 0
							@level -= 1 if @level > 0
							if metadata[:type] == 'END'
								@begin_level -= 1 if @begin_level > 0
								if @current_parent.content
									@current_parent.content.end_pos = (scanner.pos - 1) + (metadata[:end_def] - 1)
								end
								assign_parent(@current_parent.parent)
							elsif metadata[:type] == 'END_LOOP'
								if on_loop? || on_for?
									@current_parent.content.end_pos = (scanner.pos - 1) + (metadata[:end_def] - 1)
									scanner.pos = @current_parent.content.end_pos
									assign_parent(@current_parent.parent)
								else
									# something's fishy
									scanner.terminate
								end
							elsif metadata[:type] == 'END_IF'
								if on_if?
									@current_parent.content.end_pos = (scanner.pos - 1) + (metadata[:end_def] - 1)
									scanner.pos = @current_parent.content.end_pos
									assign_parent(@current_parent.parent)
								else
									# something's fishy
									scanner.terminate
								end
							end
						end
          end
        end
      end

		  def current_region
				if @current_parent && @current_parent.content
					@current_parent.content
				end
			end

			def on_spec?
				current_region && current_region.kind_of?(SpecRegion)
			end

			def on_subprog?
				current_region && current_region.kind_of?(SubprogRegion)
			end

			def on_for?
				current_region && current_region.kind_of?(ForRegion)
			end

			def on_loop?
				current_region && current_region.kind_of?(LoopRegion)
			end

			def on_if?
				current_region && current_region.kind_of?(IfRegion)
			end

			def on_anonymous?
				current_region && current_region.kind_of?(AnonymousRegion)
			end

      def assign_parent(node)
        @current_parent = node
      end

    end

  end

end
