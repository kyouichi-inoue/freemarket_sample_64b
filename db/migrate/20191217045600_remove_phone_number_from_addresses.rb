class RemovePhoneNumberFromAddresses < ActiveRecord::Migration[5.0]
  def up
    remove_column :addresses, :phone_number
      end

  def down
    add_column :addresses, :phone_number, :string
  end
end
