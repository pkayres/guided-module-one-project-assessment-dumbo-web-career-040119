class Cookie < ActiveRecord::Base
  has_many :reviews
  has_many :user, through: :reviews

  
end
