class FavoritesFacade < LocationFacade

  def initialize(user, address)
    @user = user
    @address = address
  end

  def create_favorite
    location = get_location
    favorite = Favorite.find_or_create_by(location, @user)
  end

end
