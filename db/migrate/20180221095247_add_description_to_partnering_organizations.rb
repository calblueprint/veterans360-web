class AddDescriptionToPartneringOrganizations < ActiveRecord::Migration[5.1]
  def change
    add_column :partnering_organizations, :description, :string
  end
end
