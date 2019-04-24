class Card

  attr_reader :value, :face_up

  def initialize(value = nil)
    @value = value || rand(1..10)
    @face_up = false
  end

  def hide()
    @face_up = false
  end

  def reveal()
    @face_up = true
    display
  end

  #def to_s()
  #end

 # def ==(card2)
  #  if @value == card2.value
  #    return true
   # end
  #  false
 # end

  def display
    return @value unless !@face_up
  end
end
