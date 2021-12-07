class Student < ApplicationRecord
  # Direct associations

  has_many   :attendee_ids,
             class_name: "Attendee",
             dependent: :destroy

  has_many   :written_reviews,
             class_name: "Review"

  belongs_to :user

  # Indirect associations

  has_many   :events_attending,
             through: :attendee_ids,
             source: :event

  # Validations

  # Scopes

  def to_s
    user.to_s
  end
end
