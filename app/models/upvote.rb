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

class Upvote < ApplicationRecord
  belongs_to :veteran
  belongs_to :resource

    validates_uniqueness_of :veteran_id, scope: :resource_id

end
