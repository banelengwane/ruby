require_relative 'game'
require_relative 'player'


players = [
    Player.new("Kevin", :X),
    Player.new("Maya", :O)
]

game = Game.new(players)

puts "Welcom to Tic Tac Toe"
puts "Player one's turn"
puts game.display_board
puts "Player one, pick a move."
p game.play_turn(players[0])
puts game.display_board

