require "byebug"
require_relative "weapon.rb"

class PlasmaCannon < Weapon
  def initialize ()
    super("plasma_cannon", 200, 55)
  end
end
