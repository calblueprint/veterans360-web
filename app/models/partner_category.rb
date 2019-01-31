# == Schema Information
#
# Table name: partner_categories
#
#  id                         :bigint(8)        not null, primary key
#  partnering_organization_id :bigint(8)
#  category_id                :bigint(8)
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

class PartnerCategory < ApplicationRecord
  belongs_to :partnering_organization
  belongs_to :category
end
