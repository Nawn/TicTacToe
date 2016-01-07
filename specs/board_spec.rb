require_relative 'spec_helper'

describe Board do

  before(:each) do
    rows = [["", "", ""], :separator, ["", "", ""], :separator, ["", "", ""]]
    @empty_table = Terminal::Table.new :rows => rows
    @board = Board.new
  end
  
  describe "#new" do    
    it "creates an empty board" do
      expect(@board.table).to eql(@empty_table)
    end
  end
  
  describe "#display" do 
    it "displays(puts) the table onto command prompt" do
      
    end
  end  
end