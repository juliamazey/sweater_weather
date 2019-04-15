class AntipodesFacade < LocationFacade

  def get_antipodes
    lat_long = service_1.find_antipodes(get_location)
    result = service_2.get_forecast(lat_long[:lat], lat_long[:long])
    create_antipodes(result[:currently])
  end

  def service_1
    @amypode_service ||= AmypodeService.new
  end

  def service_2
    @dark_sky_service ||= DarkSkyService.new
  end

end
