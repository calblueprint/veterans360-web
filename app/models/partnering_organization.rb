# == Schema Information
#
# Table name: resources
#
#  name          :string         
#  phone_number  :string
#  website       :string
#  address       :string
#  latitude      :float
#  longitude     :float
#  role          :integer
#  demographic   :integer
class PartneringOrganization < ApplicationRecord
	enum role: [:caregiver, :support_team, :educator, :volunteer_organization, :awareness_team]
  	enum demographic: [:active_duty, :veterans, :family_members, :children, :victims_of_violence, :suicide_prevention, :drugs_and_alcohol]
end
