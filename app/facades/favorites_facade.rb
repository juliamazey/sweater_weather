class FavoritesFacade < LocationFacade

  def initialize(user, address)
    @user = user
    @address = address
  end

  def create_favorite
    Favorite.create(user: @user, location: get_location)
  end

end
