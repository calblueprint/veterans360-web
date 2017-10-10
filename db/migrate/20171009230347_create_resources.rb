class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :fileName
      t.string :file
      t.string :category

      t.timestamps
    end
  end
end
