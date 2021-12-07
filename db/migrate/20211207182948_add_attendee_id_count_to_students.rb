class AddAttendeeIdCountToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :attendee_ids_count, :integer
  end
end
