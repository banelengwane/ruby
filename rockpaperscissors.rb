# valid moves
moves = ['rock', 'paper', 'scissors']
# get player move
print "pick your move \n>"
# p_move = gets.chomp
p_move = moves.sample
puts "you played #{p_move}"

# much better way
win_scenarios = [
  [rock scissors],
  [paper rock],
  [scissors paper]
]

lose_scenarios = [
  [scissors rock],
  [rock paper],
  [paper scissors]
]

this_game = [p_move, c_move]
puts(
  if p_move == c_move
    'Its a tie'
  elsif win_scenarios.include?(this_game)
    'You win'
  elsif lose_scenarios.include?(this_game)
    'Computer Wins'
  else
    'Unexpected input'
  end
)
