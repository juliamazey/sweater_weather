class Location < ApplicationRecord
  validates_presence_of :address
  validates_presence_of :latitude
  validates_presence_of :longitude
  validates_presence_of :image_url

  def self.create_location(address, geo_data, url)
    Location.create(address: address,
                    latitude: geo_data[:lat],
                    longitude: geo_data[:lng],
                    image_url: url
                    )
  end



end
