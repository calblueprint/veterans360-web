class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :name
      t.string :description
      t.string :file
      t.string :category
      t.references :benefactor, polymorphic: true, index: true

      t.timestamps
    end
  end
end
