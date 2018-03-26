class AddSectionToPartneringOrganizations < ActiveRecord::Migration[5.1]
  def change
    add_column :partnering_organizations, :section, :integer
  end
end
