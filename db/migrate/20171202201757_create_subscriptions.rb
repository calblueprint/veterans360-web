class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.references :veteran, foreign_key: true
      t.references :partnering_organization, foreign_key: true

      t.timestamps
    end
  end
end
