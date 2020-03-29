#!/usr/bin/env ruby
require './lib/player'

puts '--||---||---- ** This is the tick tack toe game ** ----||--||---'

puts 'Write a name for the player 1, which will be (X)'
player_x = Player.new(gets.chomp, 'X')
puts 'Write a name for the player 2, which will be (O)'
player_o = Player.new(gets.chomp, 'O')
player_o.verify(player_x)
puts "The main idea is to complete an entire line, \n could be horintally, vertically, \n or an inclined line. Each pleayer \n one at a time choose a field with \n a given number show in the board below"
board = Board.new(player_x, player_o)
board.display_board
loop {
   "#{player_x.name} select" 
}