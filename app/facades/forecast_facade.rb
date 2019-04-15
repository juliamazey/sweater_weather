class ForecastFacade < LocationFacade

  def weather_data
    location = get_location
    forecast_data = get_forecast_data(location.latitude, location.longitude)
  end

  def get_forecast_data(latitude, longitude)
    @dark_sky_service ||= DarkSkyService.new
    @dark_sky_service.get_forecast(latitude, longitude)
  end

  def weather_today
    city = @address.split(",").first.capitalize
    state = @address.split(",").last.upcase
    address = "#{city}, #{state}"
    Weather.new(weather_data, address)
  end

  def weather_hourly(limit = 8)
    data = weather_data[:hourly][:data]
    weather_h = []
    count = 0
    limit.times do
      weather_h << WeatherHourly.new(data[count], (count + 1))
      count += 1
    end
    return weather_h
  end

  def weather_weekly(limit = 5)
    data = weather_data[:daily][:data]
    weather_w = []
    count = 1
    limit.times do
      weather_w << WeatherWeekly.new(data[count], (count))
      count += 1
    end
    return weather_w
  end
end
