require "byebug"

class Array
  def sample!
    ele = self.sample
    idx = self.index(ele)
    self.delete_at(idx)
    ele
  end
end

