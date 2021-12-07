class AddStudentAttendeeCountToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :student_attendees_count, :integer
  end
end
