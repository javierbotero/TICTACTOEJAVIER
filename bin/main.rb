#!/usr/bin/env ruby
require 'lib/player'

puts "--------------This is tick tack toe game ----------------"

player_o = player("X")
player_x = player("O")
players(player_x, player_o)



def puts_table 
  arr.each_with_index do | el, index| 
    print index % 3 == 0 ? el : "\n"
  end
end

puts_table