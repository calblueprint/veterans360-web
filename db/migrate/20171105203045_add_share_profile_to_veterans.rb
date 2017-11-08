class AddShareProfileToVeterans < ActiveRecord::Migration[5.1]
  def change
    add_column :veterans, :share_profile, :boolean
  end
end
