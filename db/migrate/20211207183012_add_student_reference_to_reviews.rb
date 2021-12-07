class AddStudentReferenceToReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :reviews, :students
    add_index :reviews, :student_id
    change_column_null :reviews, :student_id, false
  end
end
