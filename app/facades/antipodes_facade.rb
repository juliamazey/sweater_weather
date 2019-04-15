class AntipodesFacade < LocationFacade

  def get_antipodes
    [Antipode.new(create_data, @address)]
  end

  def create_data
    data = {}
    data[:id] = antipode[:id]
    data[:summary] = forecast[:currently][:summary]
    data[:temp] = forecast[:currently][:temperature]
    data[:location] = forecast[:timezone]
    return data
  end

  def antipode
    amypode_service.find_antipodes(get_location)[:data]
  end

  def forecast
    lat_long = antipode[:attributes]
    dark_sky_service.get_forecast(lat_long[:lat], lat_long[:long])
  end

  def amypode_service
    @amypode_service ||= AmypodeService.new
  end

end
