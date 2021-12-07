class StudentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer

  # Direct associations

  has_many   :attendee_ids,
             resource: AttendeeResource

  has_many   :written_reviews,
             resource: ReviewResource

  belongs_to :user

  # Indirect associations

  many_to_many :events_attending,
               resource: EventResource
end
