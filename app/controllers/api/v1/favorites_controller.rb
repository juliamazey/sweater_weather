class Api::V1::FavoritesController < ApplicationController

  def create
    user = User.find_by(api_key: favorites_params[:api_key])
    if user
      facade = FavoritesFacade.new(user, favorites_params[:location])
      facade.create_favorite
      render status: 201
    else
      # render :404
    end
  end

  private

  def favorites_params
    params.permit(:location, :api_key)
  end



end
