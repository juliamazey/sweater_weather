class Api::V1::ForecastController < ApplicationController

  def show
    facade = ForecastFacade.new(params[:location])
    weather = facade.weather_today
    # facade.weather_hourly
    # facade.weather_weekly
    render json: ForecastSerializer.new(weather)
  end

end
