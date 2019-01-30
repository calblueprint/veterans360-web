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
#  lat                    :decimal(10, 6)
#  lng                    :decimal(10, 6)
#

class Veteran < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  
  include DeviseTokenAuth::Concerns::User

  has_many :upvotes, dependent: :destroy
  has_many :resources, through: :upvotes

  has_many :friendships
  has_many :follows, through: :friendships, source: :friend

  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :followers, through: :inverse_friendships, source: :veteran

  has_many :subscriptions
  has_many :po_follows, through: :subscriptions, source: :partnering_organization

  EMAIL_PATTERN = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates_confirmation_of :password
  validates :email, format: { with: EMAIL_PATTERN }, uniqueness: true, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  validate :correctly_serialized_roles, on: %i[create update]

  serialize :roles

  enum military_branch: {
    Army: 1,
    Navy: 2,
    Marines: 3,
    Air_Force: 4,
    Coast_Guard: 5,
    First_Responder: 6
  }

  ROLE_KEYS = %i[
    active_duty
    veteran
    post_911
    family_member
    caregiver
    other
  ].freeze

  ROLE_NAMES = {
    active_duty: 'Active Duty',
    veteran: 'Veteran',
    post_911: 'Post 911',
    family_member: 'Family Member',
    caregiver: 'Caregiver',
    other: 'Other'
  }.freeze

  # Accepts an array of string roles and returns the serialized integer version
  def self.serialize_string_roles(arr)
    return if arr.nil?

    arr.map { |s| ROLE_KEYS.index(s.to_sym) }
  end

  def string_roles
    roles.map { |r| ROLE_KEYS[r].to_s }
  end

  def readable_roles
    roles.map { |r| ROLE_NAMES[ROLE_KEYS[r]] }
  end

  def is_friend_of?(other)
    follows.exists?(other.id) && followers.exists?(other.id)
  end

  def sent_friend_request_to?(other)
    follows.exists?(other.id)
  end

  def is_subscribed_to?(po)
    po_follows.exists?(po.id)
  end

  private

  def correctly_serialized_roles
    unless roles.is_a?(Array)
      errors.add(:roles, 'is not an array.')
      return
    end
    roles.each do |r|
      unless r.is_a?(Integer) && r < ROLE_KEYS.length
        errors.add(:roles, 'are not well defined.')
      end
    end
  end
end
