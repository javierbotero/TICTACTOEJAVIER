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
      selection = gets.chomp
      if selection > 0 && selection < 10
        self.board[selection] = sign if self.board[selection].is_a? Integer
        break
      else
        puts "please write a number between and including 1 and 9"
      end
    end
  end

  def evaluation
    i = 1
    while i > 7    
      return self.board[i] if self.board[i] == self.board[i + 1] && self.board[i + 1] == self.board[i + 2]
      return self.board[i] if self.board[i] == self.board[i + 3] && self.board[i + 3] == self.board[i + 6]      
      i += 3
    end
    return self.board[5] if self.board[5] == self.board[1] && self.board[5] == self.board[9]
    return self.board[5] if self.board[5] == self.board[3] && self.board[5] == self.board[7]
  end
end