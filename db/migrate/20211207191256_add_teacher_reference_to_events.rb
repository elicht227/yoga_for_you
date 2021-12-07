class AddTeacherReferenceToEvents < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :events, :teachers
    add_index :events, :teacher_id
    change_column_null :events, :teacher_id, false
  end
end
