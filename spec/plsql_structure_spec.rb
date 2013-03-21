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

		@result << " #{node.content}\n"

		node.children { |child| compute_tree(child, level + 1)}
	end# }}}

  it 'should work for complex plsql code' do# {{{
    text = File.open('spec/sql/test.pkg', 'rb') { |file| file.read }
    structure = Parser::PlsqlStructure.new(text)
    compute_tree(structure.tree)
    @result.should == <<STRING
* 
|---> SpecRegion: name=test start_pos=25 end_pos=154
+---+ BodyRegion: name=test start_pos=180 end_pos=1666
    |---+ SubprogRegion: name=private_proc start_pos=232 end_pos=1367 body_start_pos=454 metadata=SubprogItem name=private_proc kind=procedure args=[ArgumentItem: name=p direction=in has_default=false data_type=integer] return_type=, end_def=33 declare_items=[VariableItem: name=l_var type="varchar2", FunctionItem name=abc kind=function args=[] return_type=boolean, end_def=27, ProcedureItem name=xyz kind=procedure args=[] return_type=, end_def=13]
|        |---> SubprogRegion: name=abc start_pos=325 end_pos=392 body_start_pos=360 metadata=SubprogItem name=abc kind=function args=[] return_type=boolean, end_def=27 declare_items=[]
|        |---> SubprogRegion: name=xyz start_pos=403 end_pos=449 body_start_pos=424 metadata=SubprogItem name=xyz kind=procedure args=[] return_type=, end_def=13 declare_items=[]
|        |---+ ForRegion: name= start_pos=485 end_pos=1036 variable=x domain=(select * from v$session) domain_type=expr
|            |---> IfRegion: name= start_pos=563 end_pos=630
|            +---+ IfRegion: name= start_pos=639 end_pos=1010
                |---+ IfRegion: name= start_pos=661 end_pos=918
|                    +---> ForRegion: name= start_pos=685 end_pos=852 variable=y domain=(select * from cat) domain_type=expr
                +---> IfRegion: name= start_pos=929 end_pos=996
|        |---> IfRegion: name= start_pos=1082 end_pos=1161
|        +---> LoopRegion: name= start_pos=1217 end_pos=1312
    |---+ SubprogRegion: name=test start_pos=1372 end_pos=1538 body_start_pos=1404 metadata=SubprogItem name=test kind=procedure args=[ArgumentItem: name=p1 direction=in has_default=false data_type=integer] return_type=, end_def=26 declare_items=[]
|        +---> AnonymousRegion: name= start_pos=1460 end_pos=1531
    +---> SubprogRegion: name=muci start_pos=1543 end_pos=1626 body_start_pos=1597 metadata=SubprogItem name=muci kind=function args=[ArgumentItem: name=x direction=in has_default=false data_type=varchar2, ArgumentItem: name=y direction=in has_default=false data_type=clob] return_type=boolean, end_def=48 declare_items=[]
STRING
  end# }}}

  it 'should work for a function' do# {{{
    text = File.open('spec/sql/test.fnc', 'rb') { |file| file.read }
    structure = Parser::PlsqlStructure.new(text)
    compute_tree(structure.tree)
    @result.should ==<<STRING
* 
+---+ SubprogRegion: name=test start_pos=18 end_pos=134 body_start_pos=118 metadata=SubprogItem name=test kind=function args=[] return_type=boolean, end_def=28 declare_items=[VariableItem: name=l_local type="varchar2", ProcedureItem name=muci kind=procedure args=[] return_type=, end_def=14]
    +---> SubprogRegion: name=muci start_pos=78 end_pos=115 body_start_pos=97 metadata=SubprogItem name=muci kind=procedure args=[] return_type=, end_def=14 declare_items=[]
STRING
  end# }}}

end

