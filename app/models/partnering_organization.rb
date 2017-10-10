# == Schema Information
#
# Table name: partnering_organization
#
# name           :string
# phone_number   :string
# address        :string
# latitude       :float
# longitude      :float
# category       :integer
# demographic    :integer
#
class PartneringOrganization < ApplicationRecord
	enum category: [:caregiver, :support_team, :educator, :volunteer_organization, :awareness_team]
	enum demographic: [:active_duty, :veterans, :family_members, :children, :victims_of_violence, :suicide_prevention, :drugs_and_alcohol]
end
