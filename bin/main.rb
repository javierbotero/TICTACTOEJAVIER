#!/usr/bin/env ruby
require './lib/player'

puts '--------------This is the tick tack toe game ----------------'

player_o = players('O')
player_x = players('X', player_o)

puts '#{player_o} and #{player_x}'