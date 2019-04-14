class ForecastFacade
  
  def initialize(address)
    @address = address
  end

  def weather_data
    location = get_location
    forecast_data = get_forecast_data(location.latitude, location.longitude)
  end

  def get_forecast_data(latitude, longitude)
    dark_sky_service = DarkSkyService.new
    dark_sky_service.get_forecast(latitude, longitude)
  end

  def get_location
    location = Location.find_by(address: @address)
    if location.nil?
      location = Location.create_location(@address, geo_data)
    end
    return location
  end

  def geo_data
    geo_service = GeocodeService.new
    geo_service.get_lat_long(@address)[:results][0][:geometry][:location]
  end


  def weather_today
    city = @address.split(",").first.capitalize
    state = @address.split(",").last.upcase
    address = "#{city}, #{state}"
    Weather.new(weather_data, address)
  end

  def weather_hourly
    data = weather_data[:hourly][:data]
    weather_h = []
    count = 0
    8.times do
      weather_h << WeatherHourly.new(data[count], (count + 1))
      count += 1
    end
    return weather_h
  end

  def weather_weekly
    data = weather_data[:daily][:data]
    weather_w = []
    count = 1
    5.times do
      weather_w << WeatherWeekly.new(data[count], (count))
      count += 1
    end
    return weather_w
  end
end
