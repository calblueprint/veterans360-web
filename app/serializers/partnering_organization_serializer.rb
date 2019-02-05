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

class PartneringOrganizationSerializer < BaseSerializer
  attributes :id,
             :name,
             :phone_number,
             :website,
             :address,
             :lat,
             :lng,
             :approval_status,
             :subscribers,
             :description
  has_many :resources, serializer: ResourcePoSerializer

end
