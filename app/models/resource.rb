# == Schema Information
#
# Table name: resources
#
#  id         :integer          not null, primary key
#  file_name  :string
#  file       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  category   :string
#
class Resource < ApplicationRecord
  # Resources can either belong to Admins or ParterOrgs
  # Both of which can be referred to as a "benefactor"
  belongs_to :benefactor, polymorphic: true
end
