class Api::V1::FavoritesController < ApplicationController
  before_action :find_user

  def create
    FavoritesFacade.new(@user, favorites_params[:location]).create_favorite
    render json: { }, status: 201
  end

  def index
    facade = FavoritesFacade.new(@user, favorites_params[:location])
    render json: {today: WeatherTodaySerializer.new(facade.all_favorites(@user))}
  end

  def destroy
    facade = FavoritesFacade.new(@user, favorites_params[:location])
    facade.remove_favorite
    render json: {today: WeatherTodaySerializer.new(facade.all_favorites(@user))}
  end

  private

  def favorites_params
    params.permit(:location, :api_key)
  end

  def find_user
    @user = User.find_by(api_key: favorites_params[:api_key])
    if @user
      return @user
    else
      render body: 'Unauthorized', status: 401
    end
  end

end
