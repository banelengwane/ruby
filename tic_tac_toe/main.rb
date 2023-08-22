require_relative 'game'
require_relative 'player'


players = [
    Player.new("Kevin", :X),
    Player.new("Maya", :O)
]

game = Game.new(players)

puts "Welcom to Tic Tac Toe"
winner = game.play_until_end
puts "#{winner.name} Won"

