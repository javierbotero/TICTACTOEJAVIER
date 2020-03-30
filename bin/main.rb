#!/usr/bin/env ruby
require './lib/player'
require './lib/board'

puts '--||---||---- ** This is the tick tack toe game ** ----||--||---'

puts 'Write a name for the player 1, which will be (X)'
player_x = Player.new(gets.chomp, 'X')
puts 'Write a name for the player 2, which will be (O)'
player_o = Player.new(gets.chomp, 'O')
player_o.verify(player_x)
print "The main idea is to complete an entire line, \n could be horizontally, vertically, \n or an inclined line. Each pleayer \n one at a time choose a field with \n a given number show in the board below"
9.times { |x|
  if x % 3 == 0
    print "\n-------------\n|"
    print " #{x + 1} |"
  else
    print " #{x + 1} |"
    puts "\n-------------" if x == 8
  end
}
board = Board.new(player_x, player_o)
board.display_board
switcher = true
counter = 1
while switcher
  if counter.odd?
    board.mark (player_x.name, player_x.sign)
  else
    board.mark (player_o.name, player_o.sign)
  end
  board.evaluation
  board.display_board
  counter += 1
end
