module Vorax

	module Parser

		class DeclareItem

      def to_s
				"#{self.class.name.split(/::/).last || ''}"
      end

		end

		class VariableItem < DeclareItem

			attr_reader :name, :type

			def initialize(name, type)
				super()
				@name = name
				@type = type
			end

      def to_s
				"#{super}: name=#{@name} type=#{@type.inspect}"
      end

      def ==(obj)
        self.name == obj.name && self.type == obj.type
      end

		end

		class ConstantItem < VariableItem
		end

		class ExceptionItem < DeclareItem

			attr_reader :name

			def initialize(name)
				super()
				@name = name
			end

      def ==(obj)
        self.name == obj.name
      end

      def to_s
				"#{super}: name=#{@name}"
      end

		end

		class TypeItem < DeclareItem

			attr_reader :name, :text
			attr_accessor :is_a

			def initialize(name, is_a, text)
				super()
				@name =name
				@is_a = is_a
				@text = text
			end

      def to_s
				"#{super}: name=#{@name} is_a=#{@is_a.inspect} text=#{@text.inspect}"
      end

      def ==(obj)
        self.name == obj.name && self.is_a == obj.is_a
      end
			
		end

		class CursorItem < DeclareItem

			attr_reader :name, :text

			def initialize(name, text)
				super()
				@name = name
				@text = text
			end

      def ==(obj)
        self.name == obj.name && self.text == obj.text
      end

      def to_s
				"#{super}: name=#{@name} text=#{@text.inspect}"
      end

		end

		class SubprogItem < DeclareItem

			attr_reader :args, :name, :kind, :return_type, :end_def, :text

			include SubprogInspector

			def initialize(text)
				super()
        describe_subprog(text)
				@text = text[0..@end_def] if @end_def
			end

      def to_s
				"#{super} name=#{@name} kind=#{@kind} args=#{@args.inspect} return_type=#{@return_type}, end_def=#{@end_def}"
      end

      def ==(obj)
        self.name == obj.name && self.args == obj.args &&
        	self.kind == obj.kind
      end

		end

		class FunctionItem < SubprogItem
		end

		class ProcedureItem < SubprogItem
		end

		class ArgumentItem < DeclareItem

			attr_accessor :direction, :has_default, :data_type, :name

			def initialize(name)
				super()
				@name = name
				@direction = :in
				@has_default = false
				@data_type = nil
			end

      def to_s
				"#{super}: name=#{@name} direction=#{@direction} has_default=#{@has_default} data_type=#{data_type}"
      end

      def ==(obj)
        self.name == obj.name && self.direction == obj.direction &&
        	self.has_default == obj.has_default && self.data_type == obj.data_type
      end

		end

	end

end
