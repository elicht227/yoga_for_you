class AddEventCountToParks < ActiveRecord::Migration[6.0]
  def change
    add_column :parks, :events_count, :integer
  end
end
