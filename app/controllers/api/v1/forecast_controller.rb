class Api::V1::ForecastController < ApplicationController

  def show
    facade = ForecastFacade.new(params[:location])
    render json: {today: WeatherTodaySerializer.new(facade.weather_today),
                  hourly: WeatherHourlySerializer.new(facade.weather_hourly),
                  weekly: WeatherWeeklySerializer.new(facade.weather_weekly)
                 }
  end

end
