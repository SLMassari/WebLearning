require "byebug"

class HumanPlayer
  def initialize
  end



  def get_input
    gets.chomp.split.map(&:to_i)
  end

  def prompt
    puts "Give next guess: (Format: 'X Y')"
  end

end
