class WeatherWeekly
  attr_reader :id,
              :day,
              :summary,
              :icon,
              :rain_prob,
              :max_temp,
              :min_temp

  def initialize(data, id)
    @day = Time.at(data[:time]).strftime("%A")
    @summary = data[:summary]
    @icon = data[:icon]
    @rain_prob = data[:precipProbability]
    @max_temp = data[:temperatureMax]
    @min_temp = data[:temperatureMin]
    @id = id
  end

end
