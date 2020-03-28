def players (player_x, player_o)
  2.loop { |x|
    puts "write a name for the player #{x} #{x == 1 ? 'X' : 'Y'}]"
    x == 1 ? player_x = x : player_o = x
  }
end