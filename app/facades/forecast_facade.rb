class ForecastFacade < LocationFacade

  def weather_data
    @weather_data ||= get_forecast_data(get_location.latitude, get_location.longitude)
  end

  def get_forecast_data(latitude, longitude)
    @get_forecast_data ||= dark_sky_service.get_forecast(latitude, longitude)
  end

  def weather_today
    city = @address.split(",").first.capitalize
    state = @address.split(",").last.upcase
    address = "#{city}, #{state}"
    Weather.new(weather_data, address)
  end

  def weather_hourly(limit = 8)
    count = 0
    limit.times.map do
      count += 1
      WeatherHourly.new(weather_data[:hourly][:data][count], (count))
    end
  end

  def weather_weekly(limit = 5)
    count = 0
    limit.times.map do
      count += 1
      WeatherWeekly.new(weather_data[:daily][:data][count], (count))
    end
  end
end
