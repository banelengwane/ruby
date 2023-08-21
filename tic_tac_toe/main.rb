require_relative 'game'
require_relative 'player'

players = [
    Player.new("Kevin", :X),
    Player.new("Maya", :O)
]

game = Game.new(players)
