class WeatherTodaySerializer
  include FastJsonapi::ObjectSerializer

  attributes :summary,
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
             :address,
             :icon,
             :id

end
