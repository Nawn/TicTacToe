require 'terminal-table'

class Board
attr_accessor :table
attr_accessor :rows
@@new_game = {:a => {1 => nil, 2 => nil, 3 => nil}, :b => {1 => nil, 2 => nil, 3 => nil}, :c => {1 => nil, 2 => nil, 3 => nil}}

  def initialize (input_rows=@@new_game)
    @rows =  input_rows
    
    table_array = [[@rows[:a][1], @rows[:a][2], @rows[:a][3]], :separator, [@rows[:b][1], @rows[:b][2], @rows[:c][3]], :separator, [@rows[:c][1], @rows[:c][2], @rows[:c][3]]]
    
    @table = Terminal::Table.new :headings => ['0-0', 1, 2, 3], :rows => table_array
    
    puts @table
  end  
  
  def display
    puts @table
  end
end