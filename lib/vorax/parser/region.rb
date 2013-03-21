require 'securerandom'

module Vorax

	module Parser

    class Region

      attr_accessor :start_pos, :end_pos
      attr_reader :name, :id, :structure

      def initialize(structure, params = {})
        @structure = structure
				opts = {
					:name => '',
					:start_pos => 0,
					:end_pos => @structure.text.length
				}.merge(params)
        @name = opts[:name]
        @start_pos = opts[:start_pos]
				@end_pos = opts[:end_pos]
      	@node = nil
      	@id = SecureRandom.uuid
      end

			def text
				@structure.text[(@start_pos..@end_pos)]
			end

      def to_s
				"#{self.class.name.split(/::/).last || ''}: name=#{@name} start_pos=#{@start_pos} end_pos=#{@end_pos}"
      end

    end

		class SpecRegion < Region
		end

		class BodyRegion < Region
		end

		class SubprogRegion < Region

			attr_accessor :body_start_pos

			def initialize(structure, params={})
				super(structure, params)
				@metadata = nil
				@body_start_pos = params[:body_start_pos] if params[:body_start_pos]
				@declare_items = nil
			end

			def metadata
				@metadata || @metadata = SubprogItem.new(text)
			end

			def declare_items
				if @declare_items
					return @declare_items
				else
					@declare_items = Parser::Declare.new(declare_section).items
					node.children.each do |child|
						subregion = child.content 
						if subregion && subregion.kind_of?(SubprogRegion)
            	if subregion.text =~ /^function/i
								@declare_items << FunctionItem.new(subregion.text)
            	elsif subregion.text =~ /^procedure/i
								@declare_items << ProcedureItem.new(subregion.text)
							end
            end
					end
					return @declare_items
				end
			end

			def to_s
				"#{super} body_start_pos=#{@body_start_pos} metadata=#{metadata} declare_items=#{declare_items}"
			end

			def node
				if @node
					@node
				else
					structure.tree.breadth_each do |node|
						@node = node[self.id]
						break if @node
					end
					@node
				end
			end

			private

			def declare_section
				crr_node = node
				if crr_node && crr_node.content
					region = crr_node.content
					declare = structure.text[(region.start_pos...region.body_start_pos)]
					offset = 0
					crr_node.children.each do |child|
						subregion = child.content 
						if subregion && (subregion.kind_of?(SubprogRegion))
							start_pos = subregion.start_pos - region.start_pos - offset
							end_pos = subregion.end_pos	- region.start_pos - offset
							# this might happen if the parsed code is invalid
							if end_pos > declare.length
								end_pos = declare.length - 1
							end
							if start_pos > declare.length
								start_pos = declare.length - 1
							end
							declare[(start_pos..end_pos)] = ''
							offset += subregion.end_pos - subregion.start_pos + 1
						end
					end
					return declare
				end
			end

		end

		class AnonymousRegion < Region
		end

		class ForRegion < Region

			attr_accessor :variable, :domain, :domain_type

			def initialize(structure, params={})
				super(structure, params)
				@variable = params[:variable] if params[:variable]
				@domain = params[:domain] if params[:domain]
				@domain_type = params[:domain_type] if params[:domain_type]
			end

			def to_s
				"#{super} variable=#{@variable} domain=#{@domain} domain_type=#{@domain_type}"
			end
			
		end

		class LoopRegion < Region
		end

		class IfRegion < Region
		end

	end

end
