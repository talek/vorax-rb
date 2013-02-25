%%{

machine for_block;

include common "common.rl";

action expr_start {
  @expr = Parser.walk_balanced_paren(data[(p..-1)])
  p += @expr.length - 1
}

action mark_end {
	@end_pos = p
}

action for_var {
	@for_var = data[(@start..@end)]
}

action start_capture_cursor {
	@cursor_var_start = p
}

action end_capture_cursor {
	@cursor_var = data[(@cursor_var_start..p-1)]
}

action start_identifier {
  @start = p
}

action end_identifier {
  @end = p - 1
}

# a bracket expression
expression = '(' >expr_start;
id = identifier >start_identifier %end_identifier;

cursor_var = qualified_identifier - K_REVERSE;

for_stmt_range = ws+ (K_REVERSE ws+)? digit+ ws* '..' ws* digit+ ws+;
for_stmt_query = ws* expression ws*;
for_stmt_cursor = ws+ cursor_var >start_capture_cursor %end_capture_cursor ws+;
for_stmt := (K_FOR ws+ id %for_var ws+ K_IN (for_stmt_range | for_stmt_query | for_stmt_cursor) K_LOOP ws+) @mark_end;

}%%


module Vorax

  module Parser

    def self.describe_for(data)
      @cursor_var = nil
      @for_var = nil
      @expr = nil
      @end_pos = -1
      if data
        eof = data.length
        %% write data;
        %% write init;
        %% write exec;
      end
      return {:cursor_var => @cursor_var,
						  :for_var => @for_var,
						  :expr => @expr,
						  :end_pos => @end_pos}
    end

  end

end
