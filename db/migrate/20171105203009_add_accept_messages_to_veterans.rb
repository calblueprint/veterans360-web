class AddAcceptMessagesToVeterans < ActiveRecord::Migration[5.1]
  def change
    add_column :veterans, :accept_messages, :boolean
  end
end
