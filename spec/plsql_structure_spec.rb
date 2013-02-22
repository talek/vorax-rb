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
+---+ test[BODY]: 180 - 1672 -> begin=1635
    |---+ private_proc[PROCEDURE]: 232 - 1373 -> begin=454
|        |---> abc[FUNCTION]: 325 - 392 -> begin=360
|        |---> xyz[PROCEDURE]: 403 - 449 -> begin=424
|        |---+ for[FOR_BLOCK]: 485 - 1042 -> begin=530
|            |---> if[IF_BLOCK]: 563 - 636 -> begin=564
|            +---+ if[IF_BLOCK]: 645 - 1016 -> begin=646
                |---+ if[IF_BLOCK]: 667 - 924 -> begin=668
|                    +---> for[FOR_BLOCK]: 691 - 858 -> begin=736
                +---> if[IF_BLOCK]: 935 - 1002 -> begin=936
|        |---> if[IF_BLOCK]: 1088 - 1167 -> begin=1089
|        +---> loop[LOOP_BLOCK]: 1223 - 1318 -> begin=1224
    |---+ test[PROCEDURE]: 1378 - 1544 -> begin=1410
|        +---> anonymous[BLOCK]: 1466 - 1537 -> begin=1461
    +---> muci[FUNCTION]: 1549 - 1632 -> begin=1603
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

