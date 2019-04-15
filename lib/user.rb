class User < ActiveRecord::Base
  has_many :reviews
  has_many :cookies, through: :reviews
end
