require 'terminal-table'
require_relative 'player.rb'

class Board
attr_reader :rows, :players
  def initialize (input_rows={:a => {1 => nil, 2 => nil, 3 => nil}, :b => {1 => nil, 2 => nil, 3 => nil}, :c => {1 => nil, 2 => nil, 3 => nil}})
    @rows =  input_rows #use class default if none set.
    @players = [Player.new("X"), Player.new("O")]
    @done = false
    
    build
  end  
  
  def done?
    @done
  end
  
  def input (input_letter=nil, board_space=nil)
    raise ArgumentError, "require 2 inputs" if (input_letter.nil? || board_space.nil?) #if inputs are empty
    raise ArgumentError, "incorrect input" if (input_letter !~ /^\w$/ || board_space !~ /^[a-zA-Z]\d$/)    
    raise ArgumentError, "does not exist" unless check_exist?(board_space)
    raise StandardError, "slot in use" if check_conflict?(board_space)
    
    spot = board_space.split("")
    @rows[spot[0].downcase.to_sym][spot[1].to_i] ||= input_letter
    display
  end
  
  def display
    build
    puts @table
  end
  
  def check
    @done = true unless any_room_left? && !check_victory #We are done, unless there's room left and no one has won.
    
    check_victory
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
  
  def check_victory
    diagonals = [ [ @rows[:a][1], @rows[:b][2], @rows[:c][3] ], [ @rows[:a][3], @rows [:b][2], @rows[:c][1] ] ]
      
  end
  
  def any_room_left? #true if any spot is Nil.
    @rows.any? do |letter, row| #in our rows
      row.any? do |number, value| #any of the rows have an empty square?
        value.nil?
      end
    end
  end
  
  def check_conflict?(input_board_space)
    position = input_board_space.split("")
    
    return false if @rows[position[0].downcase.to_sym][position[1].to_i].nil?
    
    true
  end
  
  def check_exist?(input_board_space)
    position = input_board_space.split("") #separate the letter and number for the grid.
    correct_letters = ["a", "b", "c"]
    correct_numbers = [1, 2, 3]
    
    return true if correct_letters.any? {|letter| letter == position[0].downcase} && correct_numbers.any? {|number| number == position[1].to_i}
    
    false
  end
end