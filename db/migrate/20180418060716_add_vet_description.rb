class AddVetDescription < ActiveRecord::Migration[5.1]
  def change
  	add_column :veterans, :description, :string
  end
end
