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
  constant => { add_item(ConstantItem.new(name, type)) };
  exception => { add_item(ExceptionItem.new(name)) };
  cursor => { add_item(CursorItem.new(name, capture(te))) };
  type => { add_item(TypeItem.new(name, type, capture(te))) };
  var => { add_item(VariableItem.new(name, type)) };
  function => { add_item(FunctionItem.new(capture(te))) };
  procedure => { add_item(ProcedureItem.new(capture(te))) };
  any => {};
*|;

}%%

require 'set'

module Vorax

  module Parser

    # A class used to parse a declare section
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

      private

			def capture(te)
				@code[@start_capture..te]
			end

			def name
			  @code[@start..@end]
			end

			def type
			  @code[(@start_qi..@end_qi)] if @start_qi && @end_qi
			end

			def add_item(item)
				@items << item
				@start_qi = @end_qi = nil
			end

    end

  end

end

