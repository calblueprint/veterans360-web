class AddAcceptNoticesToVeterans < ActiveRecord::Migration[5.1]
  def change
    add_column :veterans, :accept_notices, :boolean
  end
end
