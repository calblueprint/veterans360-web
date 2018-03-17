class AddTypeToResource < ActiveRecord::Migration[5.1]
  def change
    add_column :resources, :type, :integer
  end
end
