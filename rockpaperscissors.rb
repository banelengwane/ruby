# valid moves
moves = ['rock', 'paper', 'scissors']
# get player move
print "pick your move \n>"
p_move = gets.chomp

# get computer move
c_move = moves.sample
puts "you played #{p_move}"
puts "computer played #{c_move}"

# much better way
win_scenarios = [
  ['rock', 'scissors'],
  ['paper', 'rock'],
  ['scissors', 'paper']
]

lose_scenarios = [
  ['scissors', 'rock'],
  ['rock', 'paper'],
  ['paper', 'scissors']
]

this_game_moves = [p_move, c_move]
puts(
  if p_move == c_move
    'Its a tie'
  elsif win_scenarios.include?(this_game_moves)
    'You win'
  elsif lose_scenarios.include?(this_game_moves)
    'Computer Wins'
  else
    'Unexpected input'
  end
)
