class EventResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :event_name, :string
  attribute :teacher_id, :integer
  attribute :date, :date
  attribute :start_time, :string
  attribute :duration, :integer
  attribute :end_time, :string
  attribute :park_id, :integer
  attribute :category_id, :integer
  attribute :event_description, :string

  # Direct associations

  belongs_to :teacher

  has_many   :student_attendees,
             resource: AttendeeResource

  belongs_to :park

  belongs_to :category

  # Indirect associations

  many_to_many :attending_students,
               resource: StudentResource
end
