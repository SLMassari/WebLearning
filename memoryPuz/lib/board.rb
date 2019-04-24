require "byebug"
require_relative "./card.rb"
require_relative "./array_monkey.rb"

class Board

  attr_reader :grid
  attr_accessor :width

  def initialize(width = 4)
    @width = width
    @grid = Array.new(@width) { Array.new(@width) }
  end

  #fill board with shuffled card pairs
  def populate!
    first_half = Array.new(@width * @width / 2 ) { Card.new }
    all_cards = card_factory(first_half)
    
    @grid.map! do |row|
      row.map! do |ele|
        all_cards.sample!
      end
    end
  end

  #show board to user
  def render()
    @grid.each do |row|
      displayed_row = []
        row.each do |card|
          if !card.face_up
            displayed_row << "?"
          else
            displayed_row << card.value
          end
        end
        p displayed_row
      end
  end

  def won?
    @grid.all? do |row|
      row.all? do |card|
        card.face_up
      end
    end
  end

  #reveals card at guessed_pos, returns value of card. Guessed_pos must be an array
  def reveal(guessed_pos)
    selected_card = self[guessed_pos]
    if !selected_card.face_up
      return selected_card.reveal
    end
    nil
  end

  def hide(card_pos)
    selected_card = self[card_pos]
    if selected_card.face_up
      return selected_card.hide
    end
    nil
  end

  #helper methods

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def card_factory(first_half)
    second_half = []
    first_half.each do |card|
      second_half << Card.new(card.value)
    end
    first_half + second_half
  end
end
