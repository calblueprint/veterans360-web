# == Schema Information
#
# Table name: categories
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  section    :integer
#

class CategorySerializer < BaseSerializer
  attributes :id,
  			     :name,
             :section
end
