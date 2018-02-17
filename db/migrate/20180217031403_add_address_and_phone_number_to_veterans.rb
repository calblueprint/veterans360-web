class AddAddressAndPhoneNumberToVeterans < ActiveRecord::Migration[5.1]
  def change
    add_column :veterans, :address, :string
    add_column :veterans, :phone_number, :string
  end
end
