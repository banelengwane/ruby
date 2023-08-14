# REPL RPS in OOP 

#Player class (2 instances)
class Player 
    MOVES = [:rock, :paper, :scissors]
  
    attr_reader :score, :move
    
    def initialize
      @score = 0
      @move = nil
    end
  
    def get_move
      loop do
        puts "Pick a move."
        print "> "
        @move =  gets.chomp.strip.downcase.to_sym
        if MOVES.include?(@move)
          return @move
        else
          puts "invalid move."
        end
      end
    end
  end
  
  # GAME (App class)
  class Game
    WIN_SCENARIOS = [
      [:rock, :scissors], 
      [:paper, :rock],
      [:scissors, :paper]
    ]
  
    def initialize
      @player1 = Player.new
      @player2 = Player.new
    end
    
    #moves as [:rock, :scissors]
    def pick_winner(moves)
      if moves[0] == moves[1]
        puts "It's a tie!"
      elsif WIN_SCENARIOS.include?(moves)
        puts "Player 1 wins"
      else 
        puts "Player 2 wins"
      end
    end 
  end
  
