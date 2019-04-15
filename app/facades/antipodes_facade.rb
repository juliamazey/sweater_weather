class AntipodesFacade < LocationFacade

  def get_antipodes
    # binding.pry
    result_1 = service_1.find_antipodes(get_location)[:data]
    lat_long = result_1[:attributes]
    data = {}
    data[:id] = result_1[:id]
    result = service_2.get_forecast(lat_long[:lat], lat_long[:long])
    data[:summary] = result[:currently][:summary]
    data[:temp] = result[:currently][:temperature]
    data[:location] = result[:timezone]
    # binding.pry
    service_2.create_antipode(data, @address)
  end

  def service_1
    @amypode_service ||= AmypodeService.new
  end

  def service_2
    @dark_sky_service ||= DarkSkyService.new
  end

end
