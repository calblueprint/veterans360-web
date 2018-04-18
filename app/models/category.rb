class Category < ApplicationRecord
  has_many :partner_categories, dependent: :destroy
  has_many :partnering_organizations, through: :partner_categories

  enum section: {
    Vault: 1,
    Response: 2
  }

end
