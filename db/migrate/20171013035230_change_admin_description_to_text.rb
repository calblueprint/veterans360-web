class ChangeAdminDescriptionToText < ActiveRecord::Migration[5.1]
  def change
    change_column :admins, :description, :text
  end
end
