class AddEventCountToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :events_count, :integer
  end
end
