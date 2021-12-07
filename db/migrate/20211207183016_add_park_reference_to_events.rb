class AddParkReferenceToEvents < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :events, :parks
    add_index :events, :park_id
    change_column_null :events, :park_id, false
  end
end
