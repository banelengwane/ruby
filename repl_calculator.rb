# REPL Calculator

# Calculator:
# add
# subtract
# multiply
# divide
# (2 numbers only)

# input format:
# <command> <arg1> <arg2>
# add 5 12
# subtract
# divide

def calculator
  print 'To use: Type in this format: OPERATOR number1 number2.'
  puts
  loop do
    print '> '
    input = gets.chomp.split(' ')
    command = input[0].downcase
    arg1 = input[1].to_f
    arg2 = input[2].to_f
    case command
    when 'quit'
      break
    when 'add', 'sum', 'plus', '+'
      puts arg1 + arg2
    when 'multiply', 'times', '*', 'product', 'prod'
      puts arg1 * arg2
    when 'subtract', 'minus', 'difference', '-', 'diff'
      puts arg1 - arg2
    when 'divide', '/'
      puts arg1 / arg2
    when '**', 'square'
      puts arg1**arg2
    when 'help'
      puts 'to use thie calc, type in this format: Add 1 2'
    else
      puts 'Type Help'
    end
    puts
  end
  puts 'goodbye'
end

calculator

# Challenge:
# rewrite the code to take input in a different format
# x + y
