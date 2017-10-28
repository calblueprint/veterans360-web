# == Schema Information
#
# Table name: veterans
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  on_connect             :boolean          default(FALSE)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  roles                  :text             default("0")
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#

class Veteran < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friendships
  has_many :follows, through: :friendships

  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :followers, through: :inverse_friendships, source: :veteran

  serialize :roles

  def self.role_names
    [
      :active_duty,
      :veteran,
      :post_911,
      :family_member,
      :caregiver,
      :other,
    ]
  end

  # Accepts an array of string roles and returns the serialized integer version
  def self.serialize_string_roles(arr)
    arr.map { |s| self.role_names.index(s.to_sym) }
  end

  def string_roles
    role = self.role_names
    roles.map { |r| role[r].to_s }
  end

end
