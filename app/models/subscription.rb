# == Schema Information
#
# Table name: subscriptions
#
#  id                         :bigint(8)        not null, primary key
#  veteran_id                 :bigint(8)
#  partnering_organization_id :bigint(8)
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

class Subscription < ApplicationRecord
  belongs_to :veteran
  belongs_to :partnering_organization

  validates_uniqueness_of :veteran_id, scope: :partnering_organization_id
end
