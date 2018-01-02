# == Schema Information
#
# Table name: upvotes
#
#  id          :integer          not null, primary key
#  veteran_id  :integer
#  resource_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class UpvoteSerializer < ActiveModel::Serializer
  attributes :id           
end
