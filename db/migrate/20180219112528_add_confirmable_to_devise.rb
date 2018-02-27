class AddConfirmableToDevise < ActiveRecord::Migration[5.1]
  # Note: You can't use change, as User.update_all will fail in the down migration
  def up
    add_column :partnering_organizations, :confirmation_token, :string
    add_column :partnering_organizations, :confirmed_at, :datetime
    add_column :partnering_organizations, :confirmation_sent_at, :datetime
    add_column :partnering_organizations, :unconfirmed_email, :string # Only if using reconfirmable
    add_index :partnering_organizations, :confirmation_token, unique: true
    # User.reset_column_information # Need for some types of updates, but not for update_all.
    # To avoid a short time window between running the migration and updating all existing
    # users as confirmed, do the following
    #PartneringOrganizations.all.update_all confirmed_at: DateTime.now
    # All existing user accounts should be able to log in after this.
  end

  def down
    remove_columns :partnering_organizations, :confirmation_token, :confirmed_at, :confirmation_sent_at
    # remove_columns :users, :unconfirmed_email # Only if using reconfirmable
  end
end