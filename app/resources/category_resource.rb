class CategoryResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :category_name, :string_enum, allow: Category.category_names.keys
  attribute :category_description, :string

  # Direct associations

  has_many :events

  # Indirect associations
end
