class Api::V1::ForecastController < ApplicationController

  def show
    facade = ForecastFacade.new(params[:location])

  end

end
