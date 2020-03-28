#!/usr/bin/env ruby
require

puts "This is tick tack toe"



def puts_table 
  arr.each_with_index do | el, index| 
    print index % 3 == 0 ? el : "\n"
  end
end

puts_table