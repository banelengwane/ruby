require_relative 'game'
require_relative 'player'

class Session 

    def initialize
        puts "Welcom to Tic Tac Toe"

        @players = [
            Player.new("Kevin", :X),
            Player.new("Maya", :O)
        ]

        play_a_game
    end

    def play_a_game
        game = Game.new(@players)

        winner = game.play_until_end
        if winner
            puts "#{winner.name} Won"
        else 
            puts "Its a TIE!"
        end
    end
end
