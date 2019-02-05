# == Schema Information
#
# Table name: categories
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  section    :integer
#

class Category < ApplicationRecord
  has_many :partner_categories, dependent: :destroy
  has_many :partnering_organizations, through: :partner_categories

  enum section: {
    Vault: 1,
    Response: 2
  }

end
