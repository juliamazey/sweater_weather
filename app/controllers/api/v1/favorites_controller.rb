class Api::V1::FavoritesController < ApplicationController

  def create
    user = User.find_by(api_key: favorites_params[:api_key])
    if user
      facade = FavoritesFacade.new(user, favorites_params[:location])
      fav = facade.create_favorite
      render json: { }, status: 201
    else
      render json: { }, status: 401
    end
  end

  private

  def favorites_params
    params.permit(:location, :api_key)
  end



end
