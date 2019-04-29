require "byebug"
require "set"

class ComputerPlayer
  attrreader :known_cards, :@matched_cards

  def initialize
    @known_cards = Hash.new
    @matched_cards = Array.new
    @initial_guess = nil
    @matching_guess = nil
    @last_guess = nil
  end

  def prompt
    puts "Give next guess: (Format: 'X Y')"
    sleep(1)

    if knows_match?
      get_next_match
      p @initial_guess
      sleep(1)
      return @initial_guess
    end

    guess = random_guess
    @last_guess = guess
    p guess
    sleep(1)
    guess
  end


  def get_input
    
  end

  def receive_revealed_card(pos, value)
    @known_cards[pos] = value
  end

  def receive_match(pos1, pos2)
    matchArr = [pos1, pos2]
    @matched_cards.add(pos1)
    @matched_cards.add(pos2)
    #remove from known_cards list
    @known_cards.delete(pos1)
    @known_cards.delete(pos2)
  end
end
