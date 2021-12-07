class Teacher < ApplicationRecord
  # Direct associations

  has_many   :reviews,
             dependent: :destroy

  has_many   :teaching_events,
             class_name: "Event",
             dependent: :nullify

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end
end
