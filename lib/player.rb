def players(letter, player = false)
  playerName = ''  
  loop {
    puts "write a name for the player #{letter}"
    playerName = gets.chomp.match(/^[a-zA-Z\s\d]+$/) 
     if playerName = gets.chomp : "Write a regular name"
    if player == playerName
      puts "Be original, writen another name"
      next
    end
    break
  }
  playerName
end