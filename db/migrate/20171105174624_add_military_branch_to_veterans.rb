class AddMilitaryBranchToVeterans < ActiveRecord::Migration[5.1]
  def change
    add_column :veterans, :military_branch, :integer
  end
end
