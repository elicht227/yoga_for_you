class AddUserReferenceToStudents < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :students, :users
    add_index :students, :user_id
    change_column_null :students, :user_id, false
  end
end
