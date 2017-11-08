class ChangeVeteranRolesDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:veterans, :roles, '[]')
  end
end
