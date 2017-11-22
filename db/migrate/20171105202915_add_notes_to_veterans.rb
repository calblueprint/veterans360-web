class AddNotesToVeterans < ActiveRecord::Migration[5.1]
  def change
    add_column :veterans, :notes, :string
  end
end
