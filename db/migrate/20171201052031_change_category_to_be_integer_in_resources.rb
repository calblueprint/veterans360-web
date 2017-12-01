class ChangeCategoryToBeIntegerInResources < ActiveRecord::Migration[5.1]
  def change
    change_column :resources, :category, 'integer USING CAST(category AS integer)'
  end
end
