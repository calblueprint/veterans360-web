class AddImageToVeteran < ActiveRecord::Migration[5.1]
  def change
    add_column :veterans, :image, :string
  end
end
