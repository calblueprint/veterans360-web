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

class Upvote < ApplicationRecord
  belongs_to :veteran
  belongs_to :resource

    validates_uniqueness_of :veteran_id, scope: :resource_id

end
