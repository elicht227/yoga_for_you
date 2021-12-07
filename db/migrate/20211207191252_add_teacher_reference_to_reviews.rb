class AddTeacherReferenceToReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :reviews, :teachers
    add_index :reviews, :teacher_id
    change_column_null :reviews, :teacher_id, false
  end
end
