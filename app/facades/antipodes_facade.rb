class AntipodesFacade < LocationFacade

  def get_antipodes
    data = create_data(result_1, result_2)
    dark_sky_service.create_antipode(data, @address)
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
    amypode_service.find_antipodes(get_location)[:data]
  end

  def result_2
    lat_long = result_1[:attributes]
    dark_sky_service.get_forecast(lat_long[:lat], lat_long[:long])
  end

  def amypode_service
    @amypode_service ||= AmypodeService.new
  end



end
