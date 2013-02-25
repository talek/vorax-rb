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

terminator = (';' ws*) | (ws+ (K_AS | K_IS | K_DECLARE) ws+);
id = identifier >start_identifier %end_identifier;
variable_name = id - (K_CURSOR | K_TYPE | K_FUNCTION | K_PROCEDURE | K_END | K_PRAGMA);
variable_type = qualified_identifier (K_ROWTYPE | K_VARTYPE)?;

constant = terminator 
             (id ws+ K_CONSTANT ws+ 
               (qualified_identifier >{@start_qi = p} %{@end_qi = p - 1})
               (( any )* :>> ';') %tail
             ) >{@start_capture = p};

exception = terminator 
              (variable_name ws+ K_EXCEPTION
               (( any )* :>> ';') %tail
              ) >{@start_capture = p};

cursor = terminator 
           (K_CURSOR ws+ id ws+ K_IS ws+ 
              (( any )* :>> ';') %tail
           ) >{@start_capture = p};

type = terminator 
         (K_TYPE ws+ id ws+ K_IS ws+
					  (qualified_identifier >{@start_qi = p} %{@end_qi = p - 1})
            (( any )* :>> ';') %tail
         ) >{@start_capture = p};

var = terminator 
				(
					variable_name ws+ (variable_type >{@start_qi = p} %{@end_qi = p - 1})
					(( any )* :>> ';') %tail
				) >{@start_capture = p};

function = terminator 
             (
               K_FUNCTION ws+ id
							 ((( any )* :>> (';' | ws K_AS ws | ws K_IS ws)) %tail)
             ) >{@start_capture = p};

procedure = terminator 
             (
               K_PROCEDURE ws+ id
							 (( any )* :>> (';' | ws K_AS ws | ws K_IS ws)) %tail
             ) >{@start_capture = p};

main := |*
  squoted_string;
  dquoted_string;
  comment;
  constant => { 
  	item = DeclareItem.new(data[(@start..@end)])
		item.is_a = :constant
		item.type = data[(@start_qi..@end_qi)] if @start_qi && @end_qi
		item.captured_text = data[(@start_capture..te)]
  	@items << item
  	@start_qi = @end_qi = nil
  };
  exception => { 
  	item = DeclareItem.new(data[(@start..@end)])
		item.is_a = :exception
		item.type = data[(@start_qi..@end_qi)] if @start_qi && @end_qi
		item.captured_text = data[(@start_capture..te)]
  	@items << item
  	@start_qi = @end_qi = nil
	};
  cursor => { 
  	item = DeclareItem.new(data[(@start..@end)])
		item.is_a = :cursor
		item.type = data[(@start_qi..@end_qi)] if @start_qi && @end_qi
		item.captured_text = data[(@start_capture..te)]
  	@items << item
  	@start_qi = @end_qi = nil
  };
  type => { 
  	item = DeclareItem.new(data[(@start..@end)])
		item.is_a = :type
		item.type = data[(@start_qi..@end_qi)] if @start_qi && @end_qi
		item.captured_text = data[(@start_capture..te)]
  	@items << item
  	@start_qi = @end_qi = nil
  };
  var => { 
  	item = DeclareItem.new(data[(@start..@end)])
		item.is_a = :variable
		item.type = data[(@start_qi..@end_qi)] if @start_qi && @end_qi
		item.captured_text = data[(@start_capture..te)]
  	@items << item
  	@start_qi = @end_qi = nil
  };
  function => { 
  	item = DeclareItem.new(data[(@start..@end)])
		item.is_a = :function
		item.type = data[(@start_qi..@end_qi)] if @start_qi && @end_qi
		item.captured_text = data[(@start_capture..te)]
  	@items << item
  	@start_qi = @end_qi = nil
  };
  procedure => { 
  	item = DeclareItem.new(data[(@start..@end)])
		item.is_a = :procedure
		item.type = data[(@start_qi..@end_qi)] if @start_qi && @end_qi
		item.captured_text = data[(@start_capture..te)]
  	@items << item
  	@start_qi = @end_qi = nil
  };
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

    end

  end

end

