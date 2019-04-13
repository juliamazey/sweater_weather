class ForecastFacade
  def initialize(address)
    @address = address
  end

  def geo_data
    geo_service = GeocodeService.new
    geo_service.get_lat_long(@address)[:results][0][:geometry][:location]
  end

  def get_location()
    location = Location.find_by(address: @address)
    if location.nil?
      location = Location.create_location(@address, geo_data)
    end
  end

  def get_forecast_data(latitude, longitude)
    dark_sky_service = DarkSkyService.new(latitude, longitude)
    dark_sky_service.get_forecast
  end

end
