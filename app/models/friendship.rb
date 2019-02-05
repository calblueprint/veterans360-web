# == Schema Information
#
# Table name: friendships
#
#  id         :bigint(8)        not null, primary key
#  veteran_id :integer
#  friend_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Friendship < ApplicationRecord
  belongs_to :veteran
  belongs_to :friend, class_name: 'Veteran'
  
  validates_uniqueness_of :veteran_id, scope: :friend_id
end
