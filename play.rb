require_relative 'specs/spec_helper.rb'

played = false
play = true
board = Board.new

while play
  puts played ? "Again!? (Any to continue, N to exit)" : "Ready players?(Any to continue, N to exit)"
  ready = gets.chomp
  
  exit if ready == "n" || ready == "no"
  
  board.clear
  
  until board.done?
    board.players.each_with_index do |player, index|
      board.display
      
      begin
        puts "Player #{index + 1}(#{player.input_letter}), select grid position:"
        player_input = gets.chomp 
        exit if player_input.downcase == "exit"
        board.input(player.input_letter, player_input)
      rescue ArgumentError => a
        puts "Error: #{a}, please input in format: B2, C1, A3, etc."
        retry
      rescue StandardError => s
        puts "Error: #{s}, please select another grid slot"
        retry
      end
      
      player.add_point if board.check
      break if board.done?
    end
  end
  played = true
end