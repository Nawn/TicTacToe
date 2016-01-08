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
  
  describe "#input" do
    context "when given no/wrong arguments" do
      it "raises errror" do
        expect(@board.input()).to raise_error
        expect(@board.input("Top one")).to raise_error
        expect(@board.input(" ")).to raise_error
      end
    end
    
    context "when given an empty spot" do
      it "will attach the given inputLetter to the appropriate spot" do
        
      end
    end
    
    context "when given a used block" do
      it "will raise an error" do
        
      end
    end
  end
  describe "#done?" do
    context "when there are no lines done" do
      
    end
    
    context "when there's a tie/no more room" do
      
    end
    
    context "when there are some matches" do
      
    end
  end
end