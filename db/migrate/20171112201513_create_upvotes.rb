class CreateUpvotes < ActiveRecord::Migration[5.1]
  def change
    create_table :upvotes do |t|
      t.references :veteran, foreign_key: true
      t.references :resource, foreign_key: true

      t.timestamps
    end
  end
end
