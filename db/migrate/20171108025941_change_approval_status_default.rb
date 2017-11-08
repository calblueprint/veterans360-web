class ChangeApprovalStatusDefault < ActiveRecord::Migration[5.1]
  def change
    change_column :partnering_organizations, :approval_status, :boolean, :default => false
  end
end
