class ChangeVeteranRoleToText < ActiveRecord::Migration[5.1]
  def change
    change_column :veterans, :role, :text
  end
end
