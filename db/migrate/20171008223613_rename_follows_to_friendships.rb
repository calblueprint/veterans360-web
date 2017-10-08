class RenameFollowsToFriendships < ActiveRecord::Migration[5.1]
  def change
    rename_table :follows, :friendships
  end
end
