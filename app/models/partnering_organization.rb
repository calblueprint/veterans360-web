# == Schema Information
#
# Table name: partnering_organizations
#
#  id                     :bigint(8)        not null, primary key
#  name                   :string
#  phone_number           :string
#  website                :string
#  address                :string
#  lat                    :decimal(10, 6)
#  lng                    :decimal(10, 6)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
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
#  approval_status        :boolean          default(FALSE)
#  image                  :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  description            :string
#  section                :integer
#

class PartneringOrganization < ApplicationRecord

	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable # , :confirmable

	has_many :resources, :as => :owner

	has_many :subscriptions, dependent: :destroy
	has_many :subscribers, through: :subscriptions, source: :veteran
  has_many :partner_categories, dependent: :destroy
  has_many :categories, through: :partner_categories

  mount_uploader :image, ImageUploader

	geocoded_by :address, :latitude  => :lat, :longitude => :lng
	after_validation :geocode

  enum section: {
    Vault: 1,
    Response: 2
  }

  def active_for_authentication?
    super && approval_status?
  end

  def inactive_message
    if !approval_status?
      :not_approval_status
    else
      super # Use whatever other message
    end
  end
end
