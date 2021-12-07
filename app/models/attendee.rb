class Attendee < ApplicationRecord
  # Direct associations

  belongs_to :event,
             :required => false,
             :counter_cache => :student_attendees_count

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    event.to_s
  end

end
