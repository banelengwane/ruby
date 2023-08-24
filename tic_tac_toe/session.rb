require_relative 'game'
require_relative 'player'

class Session 

    def initialize
        puts "Welcom to Tic Tac Toe"

        @players = [
            Player.new("Kevin", :X),
            Player.new("Maya", :O)
        ]
        @ties = 0
        play_loop
    end

    private

    def play_loop
        loop do 
            puts "Starting a new game."
            play_a_game   
            puts display_scores
            break unless play_again?   
        end
        puts "Goodbye."
    end

    def play_again?
        print "Play again? (Y/N)\n>"
        loop do 
            answer = gets.strip[0].upcase
            case answer
            when "Y" 
                return true
            when "N"
                return false
            else
                print "What was that?(Type 'y' or 'n'\n> "
            end
        end
    end

    def play_a_game
        game = Game.new(@players)

        winner = game.play_until_end
        if winner
            puts "#{winner.name} Won"
            winner.increment_score
        else 
            puts "Its a TIE!"
            @ties += 1
        end
    end

    def display_scores
        scores_array = ["", "The scores after #{games_played} games :"]
        scores_array << @players.map do 
            |player| "#{player.name} has won #{player.score} times"
        end
       scores_array << "#{@players[0].name} and #{@players[1].name} have tied #{@ties} times"
       scores_array << ""
    end

    def games_played
        @ties + @players.reduce(0) {|a, e| a + e.score}  # a - accumulator, e - element
    end
end
