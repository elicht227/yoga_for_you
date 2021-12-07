class AddParkAddressLatitudeToPark < ActiveRecord::Migration[6.0]
  def change
    add_column :parks, :park_address_latitude, :float
  end
end
