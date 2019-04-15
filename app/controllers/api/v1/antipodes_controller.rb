class Api::V1::AntipodesController < ApplicationController

  def show
    facade = AntipodesFacade.new(params[:loc])
    render json: AntipodesSerializer.new(facade.get_antipodes)
  end

end
