class RenameColumnFollowsToFriends < ActiveRecord::Migration[5.1]
  def change
    rename_column :friendships, :follow_id, :friend_id
  end
end
