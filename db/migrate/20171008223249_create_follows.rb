class CreateFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :follows do |t|
      t.integer :veteran_id
      t.integer :follow_id

      t.timestamps
    end
    add_index :follows, :veteran_id
    add_index :follows, :follow_id
  end
end
