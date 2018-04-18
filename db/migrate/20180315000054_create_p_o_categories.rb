class CreatePOCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :p_o_categories do |t|
      t.references :partnering_organization, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
