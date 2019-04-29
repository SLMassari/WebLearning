require "byebug"
require_relative "item.rb"
class Robot
  attr_reader :position, :health, :items, :items_weight
  attr_accessor :equipped_weapon
  def initialize
    @position = [0,0]
    @health = 100
    @speed = 1
    @items = []
    @items_weight = 0
    @max_weight = 250
    @base_damage = 5
    @equipped_weapon = nil
  end

  def move_right
    move([@speed,0])
  end

  def move_left
    move([-@speed, 0])
  end

  def move_up
    move([0,@speed])
  end

  def move_down
    move([0,-@speed])
  end
  
  def move(pos_change)
    @position[0] , @position[1] = (@position[0]+pos_change[0]),(@position[1]+ pos_change[1])
  end

  def pick_up(item)
    if (@items_weight + item.weight) <= @max_weight 
      @items << item
      @items_weight += item.weight
    else
      raise ArgumentError.new("Too much weight!")
    end
  end

  def wound(damage)
    @health -= damage
    if @health < 0
      @health = 0
    end
  end

  def heal(heal_amount)
    @health += heal_amount
    if @health > 100  
      @health = 100
    end
  end

  def attack(robot2)
    if @equipped_weapon == nil
      robot2.wound(@base_damage)
    else
      @equipped_weapon.hit(robot2)
    end
  end
end
