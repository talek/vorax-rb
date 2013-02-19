%%{

machine package_spec;

include common "common.rl";

action start_identifier {
  @start = p
}

action end_identifier {
  @end = p - 1
}

terminator = (';' ws*) | (ws+ (K_AS | K_IS | K_DECLARE) ws+);
id = identifier >start_identifier %end_identifier;
variable_name = id - (K_CURSOR | K_TYPE | K_FUNCTION | K_PROCEDURE | K_END | K_PRAGMA);

constant = terminator id ws+ K_CONSTANT;
exception = terminator id ws+ K_EXCEPTION (ws+ | ';');
cursor = terminator K_CURSOR ws+ id ws+;
type = terminator K_TYPE ws+ id ws+;
global_variable = terminator variable_name ws+;
function = terminator K_FUNCTION ws+ id;
procedure = terminator K_PROCEDURE ws+ id;

main := |*
  squoted_string;
  dquoted_string;
  comment;
  constant => { @constants.add(data[(@start..@end)]) };
  exception => { @exceptions.add(data[(@start..@end)]) };
  cursor => { @cursors.add(data[(@start..@end)]) };
  type => { @types.add(data[(@start..@end)]) };
  global_variable => { @variables.add(data[(@start..@end)]) };
  function => { @functions.add(data[(@start..@end)]) };
  procedure => { @procedures.add(data[(@start..@end)]) };
  any => {};
*|;

}%%

require 'set'

module Vorax

  module Parser

    # A class used to parse a PLSQL package spec.
    class PackageSpec

      attr_reader :constants, :types, :exceptions, :cursors, :variables, :functions, :procedures

      # Walks the provided spec in order to compute the structure.
      #
      # param data [String] the package spec
      def walk(data)
        @constants = Set.new
        @types = Set.new
        @exceptions = Set.new
        @cursors = Set.new
        @variables = Set.new
        @functions = Set.new
        @procedures = Set.new
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

