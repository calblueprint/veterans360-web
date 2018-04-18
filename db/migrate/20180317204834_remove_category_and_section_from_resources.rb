class RemoveCategoryAndSectionFromResources < ActiveRecord::Migration[5.1]
  def change
    remove_column :resources, :category, :integer
    remove_column :resources, :section, :integer
  end
end
