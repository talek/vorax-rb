# encoding: UTF-8

include Vorax

describe 'plsql structure' do

  it 'should work for complex plsql code' do
    text = File.open('spec/sql/test.pkg', 'rb') { |file| file.read }
    #text = File.open('spec/sql/admin_toolkit.bdy', 'rb') { |file| file.read }
    structure = Parser::PlsqlStructure.new(text)
    @result = ''
    def compute_tree(node, level = 0)
      if node.is_root?
        @result << "*"
      else
        @result << "|" unless node.parent.is_last_sibling?
        @result << (' ' * (node.level - 1) * 4)
        @result << (node.is_last_sibling? ? "+" : "|")
        @result << "---"
        @result << (node.has_children? ? "+" : ">")
      end

      @result << " #{node.name} - #{(node.content ? node.content.end_pos : '')}\n"

      node.children { |child| compute_tree(child, level + 1)}
    end

    compute_tree(structure.tree)
    @result.should eq(<<STR
* root - 
|---+ test[SPEC]: 25 - 154
|    |---> test[PROCEDURE]: 70 - 70
|    +---> muci[FUNCTION]: 99 - 99
|---+ test[BODY]: 180 - 876
|    |---> private_proc[PROCEDURE]: 241 - 394
|    +---> xyz[PROCEDURE]: 414 - 451
|---> test[PROCEDURE]: 890 - 0
+---> anonymous[BLOCK]: 969 - 1040
STR
)
  end

end

