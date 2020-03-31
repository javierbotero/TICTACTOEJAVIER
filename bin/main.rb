#!/usr/bin/env ruby
require './lib/player'
require './lib/board'

puts '--||---||---- ** This is the tick tack toe game ** ----||--||---'
board_numbers = Proc.new do
  9.times { |x|
    if x % 3 == 0
      print "\n-------------\n|"
      print " #{x + 1} |"
    else
      print " #{x + 1} |"
      puts "\n-------------" if x == 8
    end
  }
end
board_numbers.call
player_x = nil
player_o = nil
i = 1
loop do 
  puts "Write a name for the player #{i}, which will be #{i > 1 ? 'O' : 'X'}"
  name = gets.chomp
  if name.match(/^[0-9]+$/)
    puts 'You are not a robot, please write a name'
    next 
  end
  if i > 1
    player_o = Player.new(name, 'O')
    player_o.verify(player_x)
    break
  else
    player_x = Player.new(name, 'X')
  end
  i += 1
end
board = Board.new(player_x, player_o)
print "\nThe main idea is to complete an entire line, could be horizontally, vertically, \n or an inclined line. Each pleayer one at a time choose a field with \n a given number show in the board below"
board_numbers.call
switcher = true
counter = 1
while switcher  
  if counter.odd?    
    board.mark player_x.name, player_x.sign   
  else
    board.mark player_o.name, player_o.sign
  end
  winner = board.evaluation
  if winner 
    board.result(winner == "X" ? player_x : player_o)
    counter = board.reset
  end
  counter += 1
  board.reset if counter > 9
end
