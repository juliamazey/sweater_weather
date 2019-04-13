class ForecastFacade
  def initialize(address)
    @address = address
  end

  def geo_data
    geo_service = GeocodeService.new(@address)
    geo_service.get_lat_long[:results][0][:geometry][:location]
  end

end
