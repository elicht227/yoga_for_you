class AddParkAddressLongitudeToPark < ActiveRecord::Migration[6.0]
  def change
    add_column :parks, :park_address_longitude, :float
  end
end
