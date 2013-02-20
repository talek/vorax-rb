# encoding: UTF-8

include Vorax

describe 'plsql structure' do

	before(:each) do# {{{
		@result = ""
	end# }}}

	def compute_tree(node, level = 0)# {{{
		if node.is_root?
			@result << "*"
		else
			@result << "|" unless node.parent.is_last_sibling?
			@result << (' ' * (node.level - 1) * 4)
			@result << (node.is_last_sibling? ? "+" : "|")
			@result << "---"
			@result << (node.has_children? ? "+" : ">")
		end

		@result << " #{node.name} - #{(node.content ? node.content.end_pos : '')} -> begin=#{(node.content ? node.content.body_start_pos : '')}\n"

		node.children { |child| compute_tree(child, level + 1)}
	end# }}}

  it 'should work for complex plsql code' do# {{{
    text = File.open('spec/sql/test.pkg', 'rb') { |file| file.read }
    structure = Parser::PlsqlStructure.new(text)
    compute_tree(structure.tree)
    @result.should eq(<<STR
* root -  -> begin=
|---+ test[SPEC]: 25 - 154 -> begin=0
|    |---> test[PROCEDURE]: 61 - 61 -> begin=0
|    +---> muci[FUNCTION]: 91 - 91 -> begin=0
+---+ test[BODY]: 180 - 1173 -> begin=1136
    |---+ private_proc[PROCEDURE]: 232 - 874 -> begin=454
|        |---> abc[FUNCTION]: 325 - 392 -> begin=360
|        +---> xyz[PROCEDURE]: 403 - 449 -> begin=424
    |---+ test[PROCEDURE]: 879 - 1045 -> begin=911
|        +---> anonymous[BLOCK]: 967 - 1038 -> begin=962
    +---> muci[FUNCTION]: 1050 - 1133 -> begin=1104
STR
)
  end# }}}

  it 'should work for a function' do# {{{
    text = File.open('spec/sql/test.fnc', 'rb') { |file| file.read }
    structure = Parser::PlsqlStructure.new(text)
    compute_tree(structure.tree)
    @result.should eq(<<STR
* root -  -> begin=
+---+ test[FUNCTION]: 18 - 134 -> begin=118
    +---> muci[PROCEDURE]: 78 - 115 -> begin=97
STR
)
  end# }}}

end

