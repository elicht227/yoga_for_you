class StudentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer

  # Direct associations

  has_many   :written_reviews,
             resource: ReviewResource

  belongs_to :user

  # Indirect associations

end
