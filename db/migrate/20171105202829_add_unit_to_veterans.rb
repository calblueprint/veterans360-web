class AddUnitToVeterans < ActiveRecord::Migration[5.1]
  def change
    add_column :veterans, :unit, :string
  end
end
