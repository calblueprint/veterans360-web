class Resource < ActiveRecord::Migration[5.1]
  def change
    add_column :resources, :category, :string
    remove_column :resources, :location, :string
  end
end
