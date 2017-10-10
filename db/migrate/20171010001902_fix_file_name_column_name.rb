class FixFileNameColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :resources, :fileName, :file_name
  end
end
