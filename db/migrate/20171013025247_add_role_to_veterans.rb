class AddRoleToVeterans < ActiveRecord::Migration[5.1]
  def change
    add_column :veterans, :role, :integer, default: 0
  end
end
