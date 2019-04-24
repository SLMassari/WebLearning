require "byebug"
require_relative "./card.rb"
require_relative "./board.rb"
require_relative "./human_player.rb"

class Game
  def initialize(player = HumanPlayer.new)
    @player = player
    @board = Board.new
    @board.populate!

    @guess_pos = nil
    @prev_guess_pos = nil
    @prev_guess_val = nil
  end

  def play
    until over?
      update_board
      @guess_pos = next_guess
      make_guess(@guess_pos)
    end
    puts "YOU WON!"
    sleep(5)
  end

  def update_board
    system("clear")
    @board.render
  end

  def over?
    @board.won?
  end

  def guess_prompt
    @player.prompt
    guess = @player.get_input
  end

  def next_guess
    guess = guess_prompt
    until valid_guess?(guess)
      puts "Not a valid guess!"
      guess = guess_prompt
    end
    guess
  end

  def valid_guess?(guess)
    valid_ind = (0...@board.width)
    return false unless guess.all? do |num|
      valid_ind.include?(num)
    end
    return false if @board[guess].face_up
    true
  end

  def make_guess(pos)
    if @prev_guess_pos == nil
      @prev_guess_pos = pos
      @prev_guess_val = @board.reveal(pos)
    else
      second_guess_val = @board.reveal(pos)
      update_board
      if second_guess_val != @prev_guess_val
        puts "Not a match!"
        sleep(2)
        @board.hide(pos)
        @board.hide(@prev_guess_pos)
      else
        puts "Found a match!"
        sleep(1)
      end
      @prev_guess_pos = nil
      @prev_guess_val = nil
    end
  end


end

#load board, initalize, populate

#render to screen

#get first guess

#reveal first guess

#get second guess

#reveal second guess

#check for a match

#if match, add to match list, leave flipped

#if no match, leave up for n seconds, flip down

#clear the screen
