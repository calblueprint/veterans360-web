class Category < ApplicationRecord
  has_many :partner_categories
  has_many :partnering_organizations, through: :partner_categories
end
