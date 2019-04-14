class BackgroundFacade
  def initialize(address)
    @address = address
  end

  def image
    location = get_location
    image = get_image
  end

  def get_location
    location = Location.find_by(address: @address)
    if location.nil?
      location = Location.create_location(@address, geo_data)
    end
    return location
  end

  def get_image
    image = Image.find_by(address: @address)
    if image.nil?
      image = Image.create_image(@address, geo_data, url_data(geo_data))
    end
    return image
  end

  def url_data(geo_data)
    flickr_service = FlickrService.new
    flickr_service.get_url(geo_data)
  end

  def geo_data
    geo_service = GeocodeService.new
    geo_service.get_lat_long(@address)[:results][0][:geometry][:location]
  end

end
