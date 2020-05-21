class ChangeDataPhoneNumberToDeliverAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :deliver_addresses, :phone_number, :string
  end
end
