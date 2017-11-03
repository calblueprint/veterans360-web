class AddPolymorphicRelationshipInResource < ActiveRecord::Migration[5.1]
  def change
    change_table :resources do |t|
      t.references :owner, :polymorphic => true
    end
  end
end
