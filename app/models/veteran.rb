# == Schema Information
#
# Table name: veterans
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  on_connect :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  roles      :text             default("0")
#

class Veteran < ApplicationRecord

  has_many :friendships
  has_many :follows, through: :friendships

  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :followers, through: :inverse_friendships, source: :veteran

  serialize :roles

  def string_roles
    role = [
      :active_duty,
      :veteran,
      :post_911,
      :family_member,
      :caregiver,
      :other,
    ]
    roles.map { |r| role[r].to_s }
  end

end
