require 'terminal-table'

class Board
attr_accessor :table
attr_accessor :rows
@@new_game = [["A", nil, nil, nil], :separator, ["B", nil, nil, nil], :separator, ["C", nil, nil, nil]]

  def initialize (input_rows=@@new_game)
    @rows =  input_rows
    @table = Terminal::Table.new :headings => ['0-0', 1, 2, 3], :rows => @rows
    
    puts @table
  end  
  
  def display
    puts @table
  end
end