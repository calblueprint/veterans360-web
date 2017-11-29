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
#  lat                    :decimal(10, 6)
#  lng                    :decimal(10, 6)
#  military_branch        :integer
#  unit                   :string
#  notes                  :string
#  accept_messages        :boolean
#  share_profile          :boolean
#  accept_notices         :boolean
#

class VeteranSerializer < BaseVeteranSerializer

  def roles
    object.readable_roles
  end

end
