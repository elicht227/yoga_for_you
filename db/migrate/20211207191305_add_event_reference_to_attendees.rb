class AddEventReferenceToAttendees < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :attendees, :events
    add_index :attendees, :event_id
  end
end
