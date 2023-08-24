require_relative 'game'
require_relative 'player'

class Session 

    def initialize
        puts "Welcom to Tic Tac Toe"

        @players = [
            Player.new("Kevin", :X),
            Player.new("Maya", :O)
        ]

        play_loop
    end

    private

    def play_loop
        loop do 
            puts "Starting a new game."
            play_a_game   
            break unless play_again?   
        end
        puts "Goodbye"
    end

    def play_again?
        print "Play again? (Y/N)\n>"
        answer = gets.strip[0].upcase
        answer = "Y"    
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
