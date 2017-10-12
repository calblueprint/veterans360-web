class CreatePartneringOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :partnering_organizations do |t|
      t.string :name
      t.string :phone_number
      t.string :website
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :role
      t.integer :demographic

      t.timestamps
    end
  end
end
