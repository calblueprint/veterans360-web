class PartnerCategory < ApplicationRecord
  belongs_to :partnering_organization
  belongs_to :category
end
