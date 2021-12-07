class AddUserReferenceToTeachers < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :teachers, :users
    add_index :teachers, :user_id
    change_column_null :teachers, :user_id, false
  end
end
