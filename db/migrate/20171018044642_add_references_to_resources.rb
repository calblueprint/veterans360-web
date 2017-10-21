class AddReferencesToResources < ActiveRecord::Migration[5.1]
  def change
    add_reference :resources, :partnering_organizations, foreign_key: true
  end
end
