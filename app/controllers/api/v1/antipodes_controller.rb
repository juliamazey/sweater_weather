class Api::V1::AntipodesController < ApplicationController

  def show
    facade = AntipodesFacade.new(params[:loc])
    facade.get_antipodes
  end

end
