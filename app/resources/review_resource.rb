class ReviewResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :star_rating, :float
  attribute :review_text, :string
  attribute :teacher_id, :integer
  attribute :student_id, :integer

  # Direct associations

  belongs_to :student

  belongs_to :teacher

  # Indirect associations

end
