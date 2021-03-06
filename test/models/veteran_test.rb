# == Schema Information
#
# Table name: veterans
#
#  id                     :bigint(8)        not null, primary key
#  first_name             :string
#  last_name              :string
#  on_connect             :boolean          default(FALSE)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  roles                  :text             default("[]")
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
#  military_branch        :integer
#  unit                   :string
#  notes                  :string
#  accept_messages        :boolean
#  share_profile          :boolean
#  accept_notices         :boolean
#  lat                    :decimal(10, 6)
#  lng                    :decimal(10, 6)
#  address                :string
#  phone_number           :string
#  description            :string
#  provider               :string
#  uid                    :string
#  tokens                 :text
#

require 'test_helper'

class VeteranTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
