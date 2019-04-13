class WeatherHourly
  attr_reader :time,
              :temperature
              
  def initialize(data)
    @time = Time.at(data[:time]).strftime("%I %p")
    @temperature = data[:temperature]
  end

end
