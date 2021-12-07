class AddStudentReferenceToAttendees < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :attendees, :students
    add_index :attendees, :student_id
    change_column_null :attendees, :student_id, false
  end
end
