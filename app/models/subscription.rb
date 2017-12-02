class Subscription < ApplicationRecord
  belongs_to :veteran
  belongs_to :partnering_organization
end
