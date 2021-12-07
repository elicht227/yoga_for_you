class CreateParks < ActiveRecord::Migration[6.0]
  def change
    create_table :parks do |t|
      t.integer :park_name
      t.string :park_address

      t.timestamps
    end
  end
end
