class Board
  attr_accessor :board, :scoreX, :scoreO
    
  def initialize(player1, player2)
    @board = {
      1 => 1,
      2 => 2,
      3 => 3,
      4 => 4,
      5 => 5,
      6 => 6,
      7 => 7,
      8 => 8,
      9 => 9
    }
    @scoreX = 0
    @scoreO = 0
  end

  def display_board    
    self.board.each do |key, value|
      print "\n-------------\n|" if [1, 4, 7].include?(key)
      if value.is_a? String
        print " #{value} |"
      else
        print "   |"
      end
      print "\n-------------\n" if key == 9
    end          
  end

  def mark (name, sign)
    loop do
      puts "player #{name} select a number"      
      selection = gets.chomp.to_i
      if selection > 0 && selection < 10
        if @board[selection].is_a? Integer
          @board[selection] = sign
          display_board
          break
        else
          puts "This field has been asigned"
          next
        end
      else
        puts "please write a number between and including 1 and 9"
      end      
    end
  end

  def evaluation
    i = 1
    while i < 7
      return board[i] if board[i] == board[i + 1] && board[i + 1] == board[i + 2]
      return board[i] if board[i] == board[i + 3] && board[i + 3] == board[i + 6]      
      i += 3
    end
    return board[5] if board[5] == board[1] && board[5] == board[9]
    return board[5] if board[5] == board[3] && board[5] == board[7]
  end

  def result(winner)
    if winner.sign == "X"  
      self.scoreX += 1
      summary(winner, "X")
    else
      self.scoreO += 1
      summary(winner, "O")
    end    
  end

  def reset
    @board.each_key { |key| @board[key] = key }    
    while true 
      puts "Do you want to play again? (Y/N)"
      answer = gets.chomp      
      if %w[Y y N n].include?(answer)
        break if %w[Y y].include?(answer)
        exit
      else
        puts "Please write 'Y' for yes or 'N' for no"
      end
    end
    0
  end

  protected

  def summary(winner, sign)
    puts "#{winner.name} is the WINNER of this match"
    if sign == "X"      
      puts "Player 1: #{self.scoreX} \nPlayer 2: #{self.scoreO}"
    else     
      puts "Player 2: #{self.scoreO} \nPlayer 1: #{self.scoreX}"
    end
  end
end
