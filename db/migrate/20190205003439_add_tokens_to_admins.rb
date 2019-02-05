class AddTokensToAdmins < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :provider, :string
    add_column :admins, :uid, :string
    add_column :admins, :tokens, :text

    add_index :admins, %i[uid provider], unique: true
  end
end
