require "byebug"
require_relative "robot.rb"
require_relative "item.rb"

class Bolts < Item

  def initialize
    super("bolts" , 25)
    @feed_heal_amount = 25
  end

  def feed(robot)
    robot.heal(@feed_heal_amount)
  end
end
