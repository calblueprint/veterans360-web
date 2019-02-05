# == Schema Information
#
# Table name: resources
#
#  id          :bigint(8)        not null, primary key
#  file_name   :string
#  file        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  owner_type  :string
#  owner_id    :bigint(8)
#  description :string
#

require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
