class Board
  attr_accessor :board, :score1, :score2
    
  def initialize(player1, player2)
    @board = {
      one: 1,
      two: 2,
      three: 3,
      four: 4,
      five: 5,
      six: 6,
      seven: 7,
      eight: 8,
      nine: 9
    }
    @score1 = 0
    @score2 = 0
  end

  def display_board
    self.board.each do |position, value|
      puts "------------------"
      puts value.is_a? Integer? "|#{value}|" : "| |"
    end
  end
end