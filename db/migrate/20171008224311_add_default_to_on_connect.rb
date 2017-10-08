class AddDefaultToOnConnect < ActiveRecord::Migration[5.1]
  def change
    change_column :veterans, :on_connect, :boolean, default: false
  end
end
