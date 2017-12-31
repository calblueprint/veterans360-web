# == Schema Information
#
# Table name: resources
#
#  id                          :integer          not null, primary key
#  file_name                   :string
#  file                        :string
#  category                    :integer
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  partnering_organizations_id :integer
#  owner_type                  :string
#  owner_id                    :integer
#  description                 :string
#

require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
