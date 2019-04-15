class AntipodesFacade < LocationFacade

  def get_antipodes
    data = create_data(result_1, result_2)
    service_2.create_antipode(data, @address)
  end

  def create_data(result_1, result_2)
    data = {}
    data[:id] = result_1[:id]
    data[:summary] = result_2[:currently][:summary]
    data[:temp] = result_2[:currently][:temperature]
    data[:location] = result_2[:timezone]
    return data
  end

  def result_1
    service_1.find_antipodes(get_location)[:data]
  end

  def result_2
    lat_long = result_1[:attributes]
    service_2.get_forecast(lat_long[:lat], lat_long[:long])
  end

  def service_1
    @amypode_service ||= AmypodeService.new
  end

  def service_2
    @dark_sky_service ||= DarkSkyService.new
  end

end
