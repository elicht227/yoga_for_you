class AddTeachingEventCountToTeachers < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :teaching_events_count, :integer
  end
end
