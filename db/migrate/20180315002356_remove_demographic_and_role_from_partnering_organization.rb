class RemoveDemographicAndRoleFromPartneringOrganization < ActiveRecord::Migration[5.1]
  def change
    remove_column :partnering_organizations, :demographic, :integer
    remove_column :partnering_organizations, :role, :integer
  end
end
