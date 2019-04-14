class WeatherHourlySerializer
  include FastJsonapi::ObjectSerializer

  attributes :time,
             :temperature,
             :id,
             :icon

end
