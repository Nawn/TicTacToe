require_relative 'spec_helper'

describe Player do
  describe "#new" do
    before(:all) do
      @player = Player.new ("X")
    end
    
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
end