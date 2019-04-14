class Api::V1::BackgroundController < ApplicationController

  def show
    facade = BackgroundFacade.new(params[:location])

    render json: BackgroundSerializer.new(facade.image)
  end

end
