class Subscription < ApplicationRecord
  belongs_to :veteran
  belongs_to :partnering_organization

  validates_uniqueness_of :veteran_id, scope: :partnering_organization_id
end
