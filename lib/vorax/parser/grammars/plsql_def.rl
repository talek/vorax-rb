%%{

machine plsql_def;

include common "common.rl";

action mark_spec_end {
  @end_pos = p - 1;
  @type = 'SPEC';
}

action mark_body_end {
  @end_pos = p - 1;
  @type = 'BODY';
}

action mark_end_def {
  @end_pos = p - 1;
  @type = 'END';
}

action plsql_name {
  @name = data[(@start..p-1)]
}

subprog_name = identifier - (K_IF | K_LOOP);
end_def = (K_END ws* ';' | K_END ws+ subprog_name ws* ';') @mark_end_def;
name = ((identifier '.' identifier) | identifier) >{@start = p} %plsql_name;
spec = (K_PACKAGE | K_TYPE) ws+ name ws+ (K_AS | K_IS) ws+ @mark_spec_end;
body = (K_PACKAGE | K_TYPE) ws+ K_BODY ws+ name ws+ (K_AS | K_IS) ws+ @mark_body_end;
main := body | spec | end_def;

}%%

module Vorax

  module Parser

    # Check if the provided fragment could be a PLSQL spec or body (package or type).
    #
    # @param data [String] the PLSQL spec fragment (e.g. "PACKAGE muci as")
    # @return [Hash] a hash with the following keys: :name => is the name
    #   of the PLSQL spec module, :end_def => the position where the spec
    #   fragment ends (immediatelly after "AS|IS"), :type => 'SPEC' or 'BODY'.
    def self.plsql_def(data)
      @end_pos = -1
      if data
        eof = data.length
        %% write data;
        %% write init;
        %% write exec;
      end
      return {:name => @name, :end_def => @end_pos, :type => @type}
    end

  end

end

