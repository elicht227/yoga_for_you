class TeacherResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer

  # Direct associations

  has_many   :reviews

  has_many   :teaching_events,
             resource: EventResource

  belongs_to :user

  # Indirect associations
end
