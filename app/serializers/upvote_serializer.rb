# == Schema Information
#
# Table name: upvotes
#
#  id          :bigint(8)        not null, primary key
#  veteran_id  :bigint(8)
#  resource_id :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class UpvoteSerializer < ActiveModel::Serializer
  attributes :id           
end
