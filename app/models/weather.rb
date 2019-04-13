class Weather
  attr_reader :summary,
              :temperature,
              :apparent_temperature,
              :humidity,
              :visibility,
              :uv_index,
              :date_time,
              :tonight_summary,
              :today_summary,
              :location,
              :max_temp,
              :min_temp,
              :address

  def initialize(forecast_data, address)
    @address = address
    @timezone = forecast_data[:timezone].split("/").first
    @summary = forecast_data[:currently][:summary]
    @temperature = forecast_data[:currently][:temperature]
    @apparent_temperature = forecast_data[:currently][:apparentTemperature]
    @humidity = forecast_data[:currently][:humidity]
    @visibility = forecast_data[:currently][:visibility]
    @uv_index = forecast_data[:currently][:uvIndex]
    @date_time = Time.at(forecast_data[:currently][:time]).strftime("%I:%M %p, %d/%m")
    @tonight_summary = forecast_data[:daily][:summary]
    @today_summary = forecast_data[:daily][:data][0][:summary]
    # @rain_probability = forecast_data[:daily][:data][0][:precipProbability]
    @max_temp = forecast_data[:daily][:data][0][:temperatureMax]
    @min_temp = forecast_data[:daily][:data][0][:temperatureMin]
  end

end
