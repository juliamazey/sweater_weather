class Api::V1::ImageController < ApplicationController

  def show
    facade = ImageFacade.new(params[:location])
    render json: ImageSerializer.new(facade.url)
  end

end
