class ChangeAdminRoleToRoles < ActiveRecord::Migration[5.1]
  def change
    rename_column :veterans, :role, :roles
  end
end
