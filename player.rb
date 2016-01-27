class Player
  attr_reader :input_letter, :points
  def initialize(input_letter)
    @input_letter = input_letter
    @points = 0
  end
  
  def add_point(num_of_points = 1)
    @points += num_of_points
  end
end