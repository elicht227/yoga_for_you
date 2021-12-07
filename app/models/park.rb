require "open-uri"
class Park < ApplicationRecord
  before_validation :geocode_park_address

  def geocode_park_address
    if park_address.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(park_address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.park_address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.park_address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.park_address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  enum park_name: { "alley_pond_park" => 0, "crocheron_park" => 1,
                    "cunningham_park" => 2, "kissena_park" => 3 }

  # Direct associations

  has_many   :events,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    park_name
  end
end
