require_relative 'game'
require_relative 'player'


players = [
    Player.new("Kevin", :X),
    Player.new("Maya", :O)
]

game = Game.new(players)

puts "Welcom to Tic Tac Toe"
puts "Player one's turn"
game.print_board
puts "Player one, pick a move."

game.play_turn(players[0])
game.print_board

