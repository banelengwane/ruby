class Game
    WIN_SCENARIOS = [
      [:rock, :scissors], 
      [:paper, :rock],
      [:scissors, :paper]
    ]
  
    def initialize
      @players = []
      @players << @player1 = Player.new("You")
      @players << @player2 = ComputerPlayer.new("Computer")
      play
    end
  
    #moves as [:rock, :scissors]
    def pick_winner
      if @player1.move == @player2.move
        puts "It's a tie!"
      elsif WIN_SCENARIOS.include?([@player1.move, @player2.move])
        puts "You win"
        @player1.win
      else 
        puts "Computer wins"
        @player2.win
      end
    end 
  
    def play_round 
      return false unless @players.all? do |player|
        player.get_move
      end
      print_moves
      pick_winner
      print_scores
      puts
      puts "Let's play again."
      true
    end
  
    def play
      loop do 
        break unless play_round
      end
      puts "Goodbye, thanks for playing."
    end
  
    def print_moves
      @players.each do |player|
        puts "#{player.name} played #{player.move}."
      end
    end
  
    def print_scores
      puts "Scores: "
      @players.each do |player|
         puts "#{player.name}: #{player.score} Point(s)"
      end
    end
  end
  
