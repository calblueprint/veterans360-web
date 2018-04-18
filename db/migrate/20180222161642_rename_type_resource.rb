class RenameTypeResource < ActiveRecord::Migration[5.1]
  def change
    rename_column :resources, :type, :section
  end
end
