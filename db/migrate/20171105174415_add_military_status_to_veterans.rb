class AddMilitaryStatusToVeterans < ActiveRecord::Migration[5.1]
  def change
    add_column :veterans, :military_status, :integer
  end
end
