%%{

machine declare;

include common "common.rl";

action start_identifier {
  @start = p
}

action end_identifier {
  @end = p - 1
}

action tail {
	p = p - 1
	te = p
}

prev_terminator = (';' ws*) | (ws+ (K_AS | K_IS | K_DECLARE) ws+);
next_terminator = ';'  | (ws+ (K_AS | K_IS) ws+);
id = identifier >start_identifier %end_identifier;
variable_name = id - (K_CURSOR | K_TYPE | K_FUNCTION | K_PROCEDURE | K_END | K_PRAGMA);
variable_type = qualified_identifier (K_ROWTYPE | K_VARTYPE)?;

constant = prev_terminator 
             (id ws+ K_CONSTANT ws+ 
               (qualified_identifier >{@start_qi = p} %{@end_qi = p - 1})
               (( any )* :>> ';') %tail
             ) >{@start_capture = p};

exception = prev_terminator 
              (variable_name ws+ K_EXCEPTION
               (( any )* :>> ';') %tail
              ) >{@start_capture = p};

cursor = prev_terminator 
           (K_CURSOR ws+ id ws+ K_IS ws+ 
              (( any )* :>> ';') %tail
           ) >{@start_capture = p};

type = prev_terminator 
         (K_TYPE ws+ id ws+ K_IS ws+
					  (qualified_identifier >{@start_qi = p} %{@end_qi = p - 1})
            (( any )* :>> ';') %tail
         ) >{@start_capture = p};

var = prev_terminator 
				(
					variable_name ws+ (variable_type >{@start_qi = p} %{@end_qi = p - 1})
					(( any )* :>> ';') %tail
				) >{@start_capture = p};

function = prev_terminator 
             (
               K_FUNCTION ws+ id
							 (( any )* :>> next_terminator) %tail
             ) >{@start_capture = p};

procedure = prev_terminator 
             (
               K_PROCEDURE ws+ id
							 (( any )* :>> next_terminator) %tail
             ) >{@start_capture = p};

main := |*
  squoted_string;
  dquoted_string;
  comment;
  constant => { add_item(:constant, te) };
  exception => { add_item(:exception, te) };
  cursor => { add_item(:cursor, te) };
  type => { add_item(:type, te) };
  var => { add_item(:variable, te) };
  function => { add_item(:function, te) };
  procedure => { add_item(:procedure, te) };
  any => {};
*|;

}%%

require 'set'

module Vorax

  module Parser

		class DeclareItem

			attr_reader :name
			attr_accessor :is_a, :captured_text, :type

			def initialize(name, is_a = nil, type = nil, captured_text = '')
			  @name = name
			  @is_a = is_a
			  @type = type
			  @captured_text = captured_text
			end

      def ==(obj)
        self.name == obj.name && self.is_a == obj.is_a && self.type == obj.type && self.captured_text == obj.captured_text
      end

      def debug_constructor
        "DeclareItem.new(#{@name.inspect}, #{@is_a.inspect}, #{@type.inspect}, #{@captured_text.inspect})"
      end

			def to_vim
			  "{'name' : #{@name.to_s.inspect}," +
			  " 'is_a' : #{@is_a.to_s.inspect}," +
			  " 'type' : #{@type.to_s.inspect}," +
			  " 'captured_text' : #{@captured_text.to_s.inspect}}"
			end

		end

    # A class used to parse a PLSQL package spec.
    class Declare

      attr_reader :items

			def initialize(declare_code)
			  @code = Parser.remove_all_comments(declare_code)
			  walk(@code)
			end

      # Walks the provided spec in order to compute the structure.
      #
      # param data [String] the package spec
      def walk(data)
        @items = []
        if data
          eof = data.length
          %% write data;
          %% write init;
          %% write exec;
        end
      end

			def to_vim
			  "[ #{@items.map { |i| i.to_vim }.join(',')} ]"
			end

      private

			def add_item(type, te)
				item = DeclareItem.new(@code[(@start..@end)])
				item.is_a = type
				item.type = @code[(@start_qi..@end_qi)] if @start_qi && @end_qi
				item.captured_text = @code[(@start_capture..te)]
				@items << item
				@start_qi = @end_qi = nil
			end

    end

  end

end

