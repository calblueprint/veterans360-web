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

require 'test_helper'

class PartnerCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
