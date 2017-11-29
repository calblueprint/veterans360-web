class AddLatLngToVeterans < ActiveRecord::Migration[5.1]
  def change
    add_column :veterans, :lat, :decimal, { precision: 10, scale: 6 }
    add_column :veterans, :lng, :decimal, { precision: 10, scale: 6 }
  end
end
