class Park < ApplicationRecord
  enum park_name: {"alley_pond_park"=>0, "crocheron_park"=>1, "cunningham_park"=>2, "kissena_park"=>3} 

  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    park_name
  end

end
