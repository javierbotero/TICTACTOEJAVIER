class Player
  
  attr_reader :sign 
  attr_accessor :score, :name

  def initialize (name, sign)
    @name = name
    @sign = sign
  end
  
  def verify(object_player)
    if object_player.name == self.name
      puts 'This name have been used, write another one' 
      self.name = gets.chomp
    end
  end
end