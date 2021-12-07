class Category < ApplicationRecord
  enum category_name: {"hatha"=>0, "vinyasa"=>1, "ashtanga"=>2, "yin"=>3, "restorative"=>4} 

  # Direct associations

  has_many   :events,
             :dependent => :nullify

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    category_name
  end

end
