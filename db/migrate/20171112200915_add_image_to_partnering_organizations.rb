class AddImageToPartneringOrganizations < ActiveRecord::Migration[5.1]
  def change
    add_column :partnering_organizations, :image, :string
  end
end
