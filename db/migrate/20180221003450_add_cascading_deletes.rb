class AddCascadingDeletes < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key "subscriptions", "partnering_organizations"
    add_foreign_key "subscriptions", "partnering_organizations", on_delete: :cascade
  end
end
