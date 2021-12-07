class Review < ApplicationRecord
  # Direct associations

  belongs_to :teacher,
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end

end
