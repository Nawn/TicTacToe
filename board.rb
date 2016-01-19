require 'terminal-table'
require_relative 'player.rb'

class Board
@@new_game = {:a => {1 => nil, 2 => nil, 3 => nil}, :b => {1 => nil, 2 => nil, 3 => nil}, :c => {1 => nil, 2 => nil, 3 => nil}}
attr_reader :rows, :players
  def initialize (input_rows=@@new_game)
    @rows =  input_rows #use class default if none set.
    @players = [Player.new("X"), Player.new("O")]
    
    build
  end  
  
  def input (input_letter, board_space)
    
  end
  
  def display
    puts @table
  end
  
  private
  def build
  
  header_array = [] #create the array that describes the header
  table_array = [] #create the array that will be used to make the table
  
  @rows.each_with_index do |(row_letter, row), index| #for each Row
  
    temp_row = [row_letter.to_s.upcase] #Set the row letter to show as first item
    
    row.each do |row_key, row_value| #for each item in the row
      temp_row << row_value #add it after the letter
    end
    
    table_array << temp_row #add the row to the collection
    table_array << :separator unless (index == @rows.size - 1) #add a separator, unless it's the last one
  end
    
  @table = Terminal::Table.new :headings => ['0-0', 1, 2, 3], :rows => table_array #Create the table
  
  end 
end