class AddTokensToVeterans < ActiveRecord::Migration[5.1]
  def change
    add_column :veterans, :provider, :string
    add_column :veterans, :uid, :string
    add_column :veterans, :tokens, :text

    add_index :veterans, %i[uid provider], unique: true
  end
end
