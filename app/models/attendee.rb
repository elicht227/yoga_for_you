class Attendee < ApplicationRecord
  # Direct associations

  belongs_to :student,
             counter_cache: :attendee_ids_count

  belongs_to :event,
             optional: true,
             counter_cache: :student_attendees_count

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    event.to_s
  end
end
