# Ruby::Vorax

Provides the logic required by Vorax, an Oracle IDE for geeks. Even
the main goal of this gem is to support Vorax, it can also be used
as it is to interact with a hidden SqlPLUS process or to parse 
SQL/PLSQL code.

## Installation

Add this line to your application's Gemfile:

    gem 'vorax'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vorax

## Usage

To create a SqlPLUS connection and execute something:
    
    sp = Sqlplus.new('sqlplus')
    sp.exec('select table_name from all_tables;')
    print sp.read_output(32767) while sp.busy?
    sp.terminate

To get the structure of a PLSQL code:

    text = File.open('spec/sql/test.pkg', 'rb') { |file| file.read }
    structure = Parser::PlsqlStructure.new(text)
    structure.print_tree

See the "YARD" generated documentation for additional info.

