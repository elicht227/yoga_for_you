class Event < ApplicationRecord
  # Direct associations

  has_many   :student_attendees,
             :class_name => "Attendee",
             :dependent => :nullify

  belongs_to :park,
             :counter_cache => true

  belongs_to :category,
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    event_name
  end

end
