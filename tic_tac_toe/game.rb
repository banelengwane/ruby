require_relative 'board'

class Game

    def initialize(players)
        @players = players
        @board = Board.new
    end

    def play_turn(player)
        #TODO: #play_turn (player)
        move = player.get_move
        #TODO: Get a move from player one.
        p move
        # TODO Mark that place on the board
        @board[*move]=(player.marker)
        # TODO Check for a winner
        p @board.winner?(player.marker)
    end

    def display_board
        @board.display
    end

end