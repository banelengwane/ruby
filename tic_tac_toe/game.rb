require_relative 'board'

class Game

    def initialize(players)
        @players = players
        @board = Board.new
    end

    def play_until_end
        current_player, other_player = @players
        until @winner do 
            puts display_board
            print 
            puts "It is #{current_player.name}'s turn"
            play_turn(current_player)
            @winner = current_player if @board.winner?(current_player.marker)
            current_player, other_player = other_player, current_player           
        end
        @winner 
    end


    def play_turn(player)
        move = player.get_move
        @board[*move]=(player.marker)
        @board.winner?(player.marker)
    end

    def display_board
        @board.display
    end

end