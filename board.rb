require 'terminal-table'

class Board
@@new_game = {A: ["", "", ""], B: ["", "", ""], C: ["", "", ""]}
  def initialize (input_rows=@@new_game)
    @rows =  input_rows
  end  
end