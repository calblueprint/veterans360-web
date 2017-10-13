class RemoveEmailFromVeterans < ActiveRecord::Migration[5.1]
  def change
    remove_column :veterans, :email, :string
  end
end
