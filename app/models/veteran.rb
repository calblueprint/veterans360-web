class Veteran < ApplicationRecord

  has_many :friendships
  has_many :follows, through: :friendships

  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :followers, through: :inverse_friendships, source: :veteran
  
end
