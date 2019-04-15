class Api::V1::FavoritesController < ApplicationController

  def create
    user = find_user
    if user
      FavoritesFacade.new(user, favorites_params[:location]).create_favorite
      render json: { }, status: 201
    else
      render json: { }, status: 401
    end
  end

  def index
    user = find_user
    if user
      facade = FavoritesFacade.new(user, favorites_params[:location])
      render json: {today: WeatherTodaySerializer.new(facade.all_favorites(user))}
    else
      render json: { }, status: 401
    end
  end

  def destroy
    user = find_user
    if user
      facade = FavoritesFacade.new(user, favorites_params[:location]).remove_favorite
      render json: {today: WeatherTodaySerializer.new(facade.all_favorites(user))}
    else
      render json: { }, status: 401
    end
  end

  private

  def favorites_params
    params.permit(:location, :api_key)
  end

  def find_user
    user = User.find_by(api_key: favorites_params[:api_key])
  end

end
