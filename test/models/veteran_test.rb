# == Schema Information
#
# Table name: veterans
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  on_connect             :boolean          default(FALSE)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  roles                  :text             default("0")
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#

require 'test_helper'

class VeteranTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
