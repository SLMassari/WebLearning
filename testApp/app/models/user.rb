class User < ApplicationRecord
  attr_accessor :email, :name
  has_many :microposts
end
