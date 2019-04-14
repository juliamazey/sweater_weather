class Api::V1::FavoritesController < ApplicationController

  def create
    user = find_user(favorites_params)
    if user
      facade = FavoritesFacade.new(user, favorites_params[:location])
      fav = facade.create_favorite
      render json: { }, status: 201
    else
      render json: { }, status: 401
    end
  end

  def index
    user = find_user(favorites_params)
    if user
      favorites = all_favorites(user)
      render json: {today: WeatherTodaySerializer.new(favorites)}
    else
      render json: { }, status: 401
  end

  private

  def favorites_params
    params.permit(:location, :api_key)
  end

  def all_favorites(user)
    user.locations.map do |location|
      facade = ForecastFacade.new(location.address)
      facade.weather_today
    end
  end

end
