class Student < ApplicationRecord
  # Direct associations

  has_many   :written_reviews,
             :class_name => "Review"

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end

end
