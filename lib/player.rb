class Player
  
  attr_reader :sign, :name
  attr_writer :name 

  def initialize (name, sign)
    @name = name
    @sign = sign
  end
  
  def verify(object_player)
    if object_player.name == @name
      loop do
        puts 'This name have been used, write another one'
        answer = gets.chomp
        if answer == object_player.name
          next
        else
          @name = answer
          break
        end
      end
    end
  end
end