# == Schema Information
#
# Table name: resources
#
#  id                          :integer          not null, primary key
#  file_name                   :string
#  file                        :string
#  category                    :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  partnering_organizations_id :integer
#  owner_type                  :string
#  owner_id                    :integer
#

class Resource < ApplicationRecord
  belongs_to :owner, :polymorphic => true

  mount_uploader :file, FilesUploader

  def url
    file.url
  end
end
