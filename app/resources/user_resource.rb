class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :first_name, :string
  attribute :last_name, :string

  # Direct associations

  has_one    :teacherid,
             resource: TeacherResource

  has_one    :studentid,
             resource: StudentResource

  # Indirect associations
end
