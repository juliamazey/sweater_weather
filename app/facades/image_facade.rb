class ImageFacade

  def initialize(address)
    @address = address
  end

  def url
    flickr_service = FlickrService.new
    flickr_service.get_url(geo_data)[:photos][:photo][0]
  end

  def geo_data
    geo_service = GeocodeService.new
    geo_service.get_lat_long(@address)[:results][0][:geometry][:location]
  end

end
