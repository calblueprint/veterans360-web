class AddApprovalStatusToParteneringOrgs < ActiveRecord::Migration[5.1]
  def change
    add_column :partnering_organizations, :approval_status, :boolean
  end
end
