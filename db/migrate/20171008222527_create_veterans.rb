class CreateVeterans < ActiveRecord::Migration[5.1]
  def change
    create_table :veterans do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :on_connect

      t.timestamps
    end
  end
end
