class LocationFacade
  def initialize(address)
    @address = address
  end

  def get_location
    location = Location.find_by(address: @address)
    if location.nil?
      location = Location.create_location(@address, geo_data, get_image[:url_o])
    end
    return location
  end

  def geo_data
    @geo_service ||= GeocodeService.new
    @geo_service.get_lat_long(@address)[:results][0][:geometry][:location]
  end

  def get_image
    @flickr_service ||= FlickrService.new
    @flickr_service.get_url(geo_data)[:photos][:photo][0]
  end

end
