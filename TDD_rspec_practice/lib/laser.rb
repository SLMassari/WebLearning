require "byebug"
require_relative "weapon.rb"

class Laser < Weapon

  def initialize
    super("laser", 125, 25)
  end
end
