# encoding: utf-8

require 'tree'

module Vorax

  module Parser

    class Region

      attr_accessor :start_pos, :end_pos, :body_start_pos, :context
      attr_reader :name, :type

      def initialize(name, type, start_pos = 0, end_pos = 0)
        @name = name
        @type = type
        @start_pos = start_pos
        @end_pos = end_pos
      	@body_start_pos = 0
      	@context = nil
      end

      def to_s
        "#{@name}[#{@type}]: #{@start_pos}"
      end

    end

    class PlsqlStructure

      PLSQL_SPEC = /(?:\bpackage\b|\btype\b)/i unless defined?(PLSQL_SPEC)
      SUBPROG = /(?:\bfunction\b|\bprocedure\b)/i unless defined?(SUBPROG)
      BEGIN_MODULE = /(?:\bbegin\b)/i unless defined?(BEGIN_MODULE)
      END_MODULE = /(?:\bend\b)/i unless defined?(END_MODULE)
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
        Vorax.debug(e.to_s)
      end

      def tree
				#@root.each { |t| t.content.end_pos = @text.length if t.content && t.content.end_pos == 0 }
        @root
      end

    private

      def assign_parent(node)
        @current_parent = node
      end

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
            if meta_data[:type] == 'SPEC' || meta_data[:type] == 'BODY'
              # is it a spec or a body?
              region = Region.new(meta_data[:name], meta_data[:type], scanner.pos)
              assign_parent(@current_parent << Tree::TreeNode.new(region.to_s, region))
              @level += 1
            end
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
        subprog_name = scanner.peek(32)[/(?:"[^"]+")|(?:[A-Z0-9$_#]+)/i]
          if scanner.matched =~ /function/i
            subprog_type = 'FUNCTION'
          elsif scanner.matched =~ /procedure/i
            subprog_type = 'PROCEDURE'
          end
          start_pos = scanner.pos - scanner.matched.length
          region = Region.new(subprog_name, subprog_type, start_pos)
          node = Tree::TreeNode.new(region.to_s, region)
          @current_parent << node
          if @current_parent && @current_parent.content && @current_parent.content.type == 'SPEC'
						node.content.end_pos = node.content.start_pos
          else
						@level += 1
						assign_parent(node)
          end
        end
      end

      def register_begin_spot
        @walker.register_spot(BEGIN_MODULE) do |scanner|
          @begin_level += 1
          if @begin_level > 1
            # start a new region
            region = Region.new('anonymous', 'BLOCK', scanner.pos)
            region.body_start_pos = scanner.pos - scanner.matched.length
            @level += 1
            assign_parent(@current_parent << Tree::TreeNode.new(region.to_s, region))
          else
          	if @current_parent && @current_parent.content
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
						region = Region.new('for', 'FOR_BLOCK', scanner.pos - scanner.matched.length + 1)
						region.body_start_pos = region.start_pos + handler[:end_pos]
            region.context = handler
            assign_parent(@current_parent << Tree::TreeNode.new(region.to_s, region))
						scanner.pos = region.body_start_pos
						@level += 1
					end
				end
			end

			def register_loop_spot
        @walker.register_spot(LOOP_STMT) do |scanner|
					stmt = "#{scanner.matched}#{scanner.rest}"
					region = Region.new('loop', 'LOOP_BLOCK', scanner.pos - scanner.matched.length + 1)
					region.body_start_pos = region.start_pos + 1
					assign_parent(@current_parent << Tree::TreeNode.new(region.to_s, region))
					@level += 1
				end
			end

			def register_if_spot
        @walker.register_spot(IF_STMT) do |scanner|
					stmt = "#{scanner.matched}#{scanner.rest}"
					region = Region.new('if', 'IF_BLOCK', scanner.pos - scanner.matched.length + 1)
					region.body_start_pos = region.start_pos + 1
					assign_parent(@current_parent << Tree::TreeNode.new(region.to_s, region))
					@level += 1
				end
			end

      def register_end_spot
        @walker.register_spot(END_MODULE) do |scanner|
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
								if @current_parent.content && (@current_parent.content.type == 'FOR_BLOCK' || @current_parent.content.type == "LOOP_BLOCK")
									@current_parent.content.end_pos = (scanner.pos - 1) + (metadata[:end_def] - 1)
									scanner.pos = @current_parent.content.end_pos
									assign_parent(@current_parent.parent)
								else
									# something's fishy
									scanner.terminate
								end
							elsif metadata[:type] == 'END_IF'
								if @current_parent.content && @current_parent.content.type == 'IF_BLOCK'
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

    end

  end

end
