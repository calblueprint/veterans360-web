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
  scope :by_category, -> cat { where(category: cat) }

  belongs_to :owner, :polymorphic => true

  has_many :upvotes, :dependent => :destroy
  has_many :veterans, through: :upvotes

  mount_uploader :file, FilesUploader

  enum resource_sections: {
    Vault: 0,
    Response: 1
  }

  def categories
    owner.categories
  end

  def url
    file.url
  end

  def upvoted_by?(veteran)
    upvotes.exists?(veteran_id: veteran.id)
  end

end
