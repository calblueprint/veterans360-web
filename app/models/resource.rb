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
	belongs_to :partnering_organizations
end
