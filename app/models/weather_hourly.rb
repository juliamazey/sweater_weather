class WeatherHourly
  attr_reader :time,
              :temperature,
              :id,
              :icon

  def initialize(data, id)
    @id = id
    @time = Time.at(data[:time]).strftime("%I %p")
    @temperature = data[:temperature]
    @icon = data[:icon]
  end

end
