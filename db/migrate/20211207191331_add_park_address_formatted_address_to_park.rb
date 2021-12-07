class AddParkAddressFormattedAddressToPark < ActiveRecord::Migration[6.0]
  def change
    add_column :parks, :park_address_formatted_address, :string
  end
end
