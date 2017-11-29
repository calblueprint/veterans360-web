class ChangeLatLngOfParteringOrgs < ActiveRecord::Migration[5.1]
  def change
    rename_column :partnering_organizations, :latitude, :lat
    rename_column :partnering_organizations, :longitude, :lng
    change_column :partnering_organizations, :lat, :decimal, { precision: 10, scale: 6 }
    change_column :partnering_organizations, :lng, :decimal, { precision: 10, scale: 6 }
  end
end
