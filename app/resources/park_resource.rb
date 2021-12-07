class ParkResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :park_name, :string_enum, allow: Park.park_names.keys
  attribute :park_address, :string

  # Direct associations

  has_many   :events

  # Indirect associations

end
