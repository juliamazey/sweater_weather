class FavoritesFacade < LocationFacade

  def initialize(user, address)
    @user = user
    @address = address
  end

  def create_favorite
    Favorite.create(user: @user, location: get_location)
  end

  def remove_favorite
    Favorite.find_by(user: @user, location: get_location).destroy
  end

  def all_favorites(user)
    user.locations.map do |location|
      facade = ForecastFacade.new(location.address)
      facade.weather_today
    end
  end

end
