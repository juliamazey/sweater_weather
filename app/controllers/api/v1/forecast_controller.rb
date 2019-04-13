class Api::V1::ForecastController < ApplicationController

  def show
    facade = ForecastFacade.new(params[:location])
    weather = facade.weather_data

    render json: ForecastSerializer.new(weather)
  end

end
