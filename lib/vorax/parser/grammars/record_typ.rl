%%{

machine record_typ;

include common "common.rl";

action expr_start {
  expr = Parser.walk_balanced_paren(data[(p..-1)])
  p += expr.length - 1
  te = p
}

# a bracket expression
separator = (ws+ K_IS ws+ K_RECORD ws* '(' ws*) | (',' ws*);
expression = '(' >expr_start;
attr_spot = separator (identifier >{ @start = p } %{ @attr = data[(@start..p)] }) 
              ws* (identifier > { @start = p } %{ @attributes << { :name => @attr, :type => data[(@start..p)] } });

main := |*
  squoted_string;
  dquoted_string;
  comment;
  attr_spot;
  expression;
  any => {};
*|;

}%%

module Vorax

	module Parser

		def Parser.describe_record(data)
		  @attributes = []
		  if data
			  eof = data.length
        %% write data;
        %% write init;
        %% write exec;
		  end
		  return @attributes
		end

	end

end
