class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :file_name
      t.string :file
      t.string :category

      t.timestamps
    end
  end
end
