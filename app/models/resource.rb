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

class Resource < ApplicationRecord
  belongs_to :owner, :polymorphic => true
  has_many :upvotes, :dependent => :destroy
  has_many :veterans, through: :upvotes
  mount_uploader :file, FilesUploader

  enum resource_categories: {
    Financial: 1,
    Volunteerism: 2,
    Housing: 3,
    Benefits: 4,
    Career_Advice: 5,
    Employment: 6,
    Education: 7,
    Peer_Groups: 8,
    Crisis_Support: 9
  }

  def url
    file.url
  end

  def upvoted_by?(veteran)
    upvotes.exists?(veteran_id: veteran.id)
  end

  
end
