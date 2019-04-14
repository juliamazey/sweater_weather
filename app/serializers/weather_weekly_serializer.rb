class WeatherWeeklySerializer
  include FastJsonapi::ObjectSerializer

  attributes :id,
             :day,
             :summary,
             :icon,
             :rain_prob,
             :max_temp,
             :min_temp

end
