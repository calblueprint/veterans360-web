# == Schema Information
#
# Table name: resources
#
#  id                          :integer          not null, primary key
#  file_name                   :string
#  file                        :string
#  category                    :integer
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  partnering_organizations_id :integer
#  owner_type                  :string
#  owner_id                    :integer
#  description                 :string
#

class ResourceSerializer < BaseSerializer
  belongs_to :owner
  attributes :id,
             :file_name,
             :file,
             :category,
             :description,
             :updated_at,
             :owner_id,
             :veteran_has_upvoted,
             :num_upvotes

  def veteran_has_upvoted
    object.upvoted_by?(scope[:current_veteran])
  end
  
  def num_upvotes
    object.upvotes.count
  end
end
