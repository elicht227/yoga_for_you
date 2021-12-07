class AttendeeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :event_id, :integer
  attribute :student_id, :integer

  # Direct associations

  belongs_to :student

  belongs_to :event

  # Indirect associations
end
