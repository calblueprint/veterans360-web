class RemoveEmailFromAdmins < ActiveRecord::Migration[5.1]
  def change
    remove_column :admins, :email, :string
  end
end
