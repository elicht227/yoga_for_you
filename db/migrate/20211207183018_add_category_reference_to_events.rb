class AddCategoryReferenceToEvents < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :events, :categories
    add_index :events, :category_id
    change_column_null :events, :category_id, false
  end
end
