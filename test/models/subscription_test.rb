# == Schema Information
#
# Table name: subscriptions
#
#  id                         :bigint(8)        not null, primary key
#  veteran_id                 :bigint(8)
#  partnering_organization_id :bigint(8)
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
