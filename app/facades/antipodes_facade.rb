class AntipodesFacade < LocationFacade

  def get_antipodes
    data = service_1.find_antipodes(get_location)[:data]
    lat_long = data[:attributes]
    result = service_2.get_forecast(lat_long[:lat], lat_long[:long])
    data[:attributes] = result[:currently]
    data[:location] = result[:timezone]
    service_2.create_antipode(data, @address)
  end

  def service_1
    @amypode_service ||= AmypodeService.new
  end

  def service_2
    @dark_sky_service ||= DarkSkyService.new
  end

end
