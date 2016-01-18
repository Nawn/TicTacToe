require_relative 'spec_helper'

describe Board do

  before(:each) do
    @empty_rows = {:a => {1 => nil, 2 => nil, 3 => nil}, :b => {1 => nil, 2 => nil, 3 => nil}, :c => {1 => nil, 2 => nil, 3 => nil}}
    @board = Board.new
  end
  
  describe "#new" do    
    context "When given no arguments" do
      it "creates an empty board" do
        expect(@board.rows).to eql(@empty_rows)
      end
    end
    
    context "when given an argument" do
      it "will keep that table" do
        temp_rows = {:a => {1 => nil, 2 => nil, 3 => nil}, :b => {1 => "X", 2 => "X", 3 => "O"}, :c => {1 => "X", 2 => nil, 3 => "O"}}
        @board = Board.new (temp_rows)
        expect(@board.rows).to eql(temp_rows)
      end
    end
  end
  
  describe "#input" do
    context "when given incorrect # of arguments" do
      it "raises errror" do
        expect(@board.input()).to raise_error
        expect(@board.input("Top one")).to raise_error
        expect(@board.input(" ")).to raise_error
        expect(@board.input("O")).to raise_error
      end
    end
    
    context "when given wrong arguments" do
      it "raises errors" do
        expect(@board.input("X", "pipi")).to raise_error
        expect(@board.input("O", 3)).to raise_error
      end
    end
	
    context "when given a spot that does not exist" do
      it "raises an error" do
        expect(@board.input("O", "B7")).to raise_error
        expect(@board.input("O", "A4")).to raise_error
        expect(@board.input("O", "D2")).to raise_error
      end
    end
    
    context "when given an empty spot" do
      it "will attach the given inputLetter to the appropriate spot" do
        @board.input("X", "B2")
        expect(@board.rows).to eql({:a=>{1=>nil, 2=>nil, 3=>nil}, :b=>{1=>nil, 2=>"X", 3=>nil}, :c=>{1=>nil, 2=>nil, 3=>nil}})
      end
      
      it "will add more if you keep adding" do
        @board = Board.new
        @board.input("X", "A1")
        @board.input("O", "B3")
        @board.input("X", "C2")
        @board.input("O", "A3")
        
        expect(@board.rows).to eql({:a=>{1=>"X", 2=>nil, 3=>"O"}, :b=>{1=>nil, 2=>nil, 3=>"O"}, :c=>{1=>nil, 2=>"X", 3=>nil}})
      end
    end
    
    context "when given a used block" do
      it "will raise an error" do
        @board.input("X", "C2")
        expect(@board.input("O", "C2")).to raise_error
      end
    end
  end
  
  describe "#check_victory/#done?" do #check will return true if you won the round, wheras done will return true if there Has been a factory/tie
    context "when there are no lines done" do
      it "will return false on Check because you have not won, and false on done because there's still room" do
        unfinished_board = {:a => {1 => nil, 2 => nil, 3 => nil}, :b => {1 => "X", 2 => "X", 3 => "O"}, :c => {1 => "X", 2 => nil, 3 => "O"}}
        @board = Board.new(unfinished_board)
        expect(@board.check).to be false
        expect(@board.done?).to be false
      end
    end
    
    context "when there's a tie/no more room" do
      it "returns false on Check because no victory, but true on done because there's no more room" do
        tie_board = {:a => {1 => "O", 2 => "O", 3 => "X"}, :b => {1 => "X", 2 => "X", 3 => "O"}, :c => {1 => "O", 2 => "X", 3 => "X"}}
        @board = Board.new(tie_board)
        expect(@board.check).to be false
        expect(@board.done?).to be true
      end
    end
    
    context "when there are some matches" do
      it "returns true on both, because there's a victor and therefore, cannot continue" do
        winning_board = {:a => {1 => "O", 2 => nil, 3 => "X"}, :b => {1 => nil, 2 => "X", 3 => "X"}, :c => {1 => "O", 2 => "O", 3 => "X"}}
        @board = Board.new(winning_board)
        expect(@board.check).to be true
        expect(@board.done?).to be true
      end
    end
  end
end