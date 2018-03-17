class RenamePoCategoryToPartnerCategory < ActiveRecord::Migration[5.1]
  def change
    rename_table :p_o_categories, :partner_categories
  end
end
