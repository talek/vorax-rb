%%{

machine subprog;

include common "common.rl";

action eat_till_next {
  rest = data[(p..data.length)]
  pos = Parser.next_argument(rest) - 1
	@args.last && @args.last.has_default = true
	p = p + pos - 1 if pos > 0
}

action eat_till_end {
	text = data[p..eof]
	pos = 0
	walker = PLSQLWalker.new(text)
	walker.register_spot(/(\bAS\b)|(\bIS\b)|;/i) do |scanner|
		pos = scanner.pos - scanner.matched.length
	  scanner.terminate
	end
	walker.walk
	p = p + pos - 1 if pos > 0
  @end_def = p
}

data_type = qualified_identifier (K_ROWTYPE | K_VARTYPE)?;
return = K_RETURN ws+ (data_type >{@start = p} %{@return_type = data[@start...p]});
arg_direction = ((K_IN ws+ K_OUT) %{ @args.last && @args.last.direction=:inout} | 
                 K_IN %{@args.last && @args.last.direction = :in} | 
                 K_OUT %{@args.last && @args.last.direction = :out} ) ws+;
default = (ws+ (K_DEFAULT | ':=')) %eat_till_next;
argument = identifier >{@start = p} %{@args << ArgumentItem.new(data[@start...p])} 
           ws+ arg_direction? (K_NOCOPY ws+)? 
           data_type >{@start = p} %{@args.last && @args.last.data_type = data[@start...p]}
           default?;
arg_list = argument (ws* ',' ws* argument)*;
args = ws* '(' ws* arg_list ws* ')';
name = qualified_identifier >{@start = p} %{@name = data[@start...p]};
procedure = K_PROCEDURE >{@start = p} %{@kind = data[@start...p]} ws+ name args?;
function = K_FUNCTION >{@start = p} %{@kind = data[@start...p]} ws+ name args? ws+ return;
signature := (function | procedure) (';' | ws) >eat_till_end;

}%%

module Vorax

	module Parser

		module SubprogInspector

			def describe_subprog(data)
				@args = []
				@name = nil
				@kind = nil
				@return_type = nil
				@end_def = nil
				if data
				  data << ' '
					eof = data.length
					%% write data;
					%% write init;
					%% write exec;
				  data.chop
				end
				{:name => @name, 
				 :kind => @kind, 
				 :args => @args, 
				 :return_type => @return_type, 
				 :end_def => @end_def}
			end

		end
	
	end

end
