class Weather
  attr_reader :id,
              :summary,
              :temperature,
              :apparent_temperature,
              :humidity,
              :visibility,
              :uv_index,
              :date_time

  def initialize(forecast_data)
    @id = 1
    @summary = forecast_data[:currently][:summary]
    @temperature = forecast_data[:currently][:temperature]
    @apparent_temperature = forecast_data[:currently][:apparentTemperature]
    @humidity = forecast_data[:currently][:humidity]
    @visibility = forecast_data[:currently][:visibility]
    @uv_index = forecast_data[:currently][:uvIndex]
    @date_time = DateTime.now.strftime("%I:%M %p, %d/%m")
    @tonight_summary = forecast_data[:daily][:summary]
    @today_summary = forecast_data[:daily][:data][0][:summary]
    @rain_probability = forecast_data[:daily][:data][0][:precipProbability]
    @max_temp = forecast_data[:daily][:data][0][:temperatureMax]
    @min_temp = forecast_data[:daily][:data][0][:temperatureMin]
  end

end
