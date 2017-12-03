class AddPrimaryKeyIndexToFriendships < ActiveRecord::Migration[5.1]
  def change
    add_index :friendships, [:veteran_id, :friend_id], unique: true
  end
end
