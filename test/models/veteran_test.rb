# == Schema Information
#
# Table name: veterans
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  on_connect :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  roles      :text             default("0")
#

require 'test_helper'

class VeteranTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
