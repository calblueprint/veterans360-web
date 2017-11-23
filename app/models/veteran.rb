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
#  roles                  :text             default("[]")
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
#  military_branch        :integer
#  unit                   :string
#  notes                  :string
#  accept_messages        :boolean
#  share_profile          :boolean
#  accept_notices         :boolean
#

class Veteran < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :upvotes, :dependent => :destroy
  has_many :resources, through: :upvotes

  has_many :friendships
  has_many :follows, through: :friendships

  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :followers, through: :inverse_friendships, source: :veteran

  EMAIL_PATTERN = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_confirmation_of :password
  validates :email, format: { with: EMAIL_PATTERN }, uniqueness: true, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  validate :correctly_serialized_roles, on: [ :create, :update ]

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
    if arr.nil?
      return
    end
    arr.map { |s| Veteran.role_names.index(s.to_sym) }
  end

  def string_roles
    role = Veteran.role_names
    roles.map { |r| role[r].to_s }
  end

  private

  def correctly_serialized_roles
    unless self.roles.is_a?(Array)
      errors.add(:roles, 'is not an array.')
      return
    end
    self.roles.each do |r|
      unless r.is_a?(Integer) && r < Veteran.role_names.length
        errors.add(:roles, 'are not well defined.')
      end
    end
  end

end
