class WeatherHourly
  attr_reader :time,
              :temperature,
              :id

  def initialize(data, id)
    @id = id
    @time = Time.at(data[:time]).strftime("%I %p")
    @temperature = data[:temperature]
  end

end
