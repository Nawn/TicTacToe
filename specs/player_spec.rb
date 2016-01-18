require_relative 'spec_helper'

describe Player do
  before(:each) do
    @player = Player.new ("X")
  end
  
  describe "#new" do
    it "creates an instance of Player" do
      expect(@player).to be_a Player
    end
    
    context "when given input letter, X" do
      it "will have an input letter of X" do
        expect(@player.input_letter).to eql("X")
      end
    end
    
    context "when given input letter, O" do
      it "will have an input letter of O" do
        @player = Player.new("O")
        expect(@player.input_letter).to eql("O")
      end
    end
  end
  
  describe "#add_point" do
    context "when given no input" do
      it "increments points by one" do
        @player.add_point
        expect(@player.points).to eql(1)
        @player.add_point
        expect(@player.points).to eql(2)
      end
    end
    
    context "when given an input" do
      it "will increment by input" do
        @player.add_point(2)
        expect(@player.points).to eql(2)
        @player.add_point(2)
        expect(@player.points).to eql(4)
      end
    end
  end
end