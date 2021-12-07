class Event < ApplicationRecord
  # Direct associations

  belongs_to :teacher,
             :counter_cache => :teaching_events_count

  has_many   :student_attendees,
             :class_name => "Attendee",
             :dependent => :nullify

  belongs_to :park,
             :counter_cache => true

  belongs_to :category,
             :counter_cache => true

  # Indirect associations

  has_many   :attending_students,
             :through => :student_attendees,
             :source => :student

  # Validations

  # Scopes

  def to_s
    event_name
  end

end
