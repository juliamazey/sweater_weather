class Location < ApplicationRecord
  validates_presence_of :address
  validates_presence_of :latitude
  validates_presence_of :longitude

  def self.create_location(address, geo_data)
    Location.create(address: address,
                    latitude: geo_data[:lat],
                    longitude: geo_data[:lng])
  end



end
