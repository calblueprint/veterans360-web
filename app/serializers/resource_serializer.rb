# == Schema Information
#
# Table name: resources
#
#  id          :bigint(8)        not null, primary key
#  file_name   :string
#  file        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  owner_type  :string
#  owner_id    :bigint(8)
#  description :string
#

class ResourceSerializer < BaseSerializer
  belongs_to :owner
  attributes :id,
             :file_name,
             :file,
             :description,
             :updated_at,
             :owner_id,
             :created_at,
             :veteran_has_upvoted,
             :num_upvotes

  def veteran_has_upvoted
    if scope
      object.upvoted_by?(scope[:current_veteran])
    end
  end

  def categories
    category_arr = []
    object.categories.each do |c|
      category_arr.push(c.name)
    end
    return category_arr
  end

  def num_upvotes
    object.upvotes.count
  end
end
