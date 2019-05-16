class Micropost < ApplicationRecord
  attr_accessor :content, :user_id
  
  belongs_to :user

  validates :content , :length => { :maximum => 140 }
end
