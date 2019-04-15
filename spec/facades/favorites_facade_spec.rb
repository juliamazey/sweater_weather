require 'rails_helper'

describe FavoritesFacade do
  before :each do
    @address = 'denver,co'
    @user = create(:user)
    @facade = FavoritesFacade.new(@user, @address)
    @location_1, @location_2 = create_list(:location, 2)
    @favorite_1 = create(:favorite, user: @user, location: @location_1)
    @favorite_2 = create(:favorite, user: @user, location: @location_2)
    @favorite = @facade.create_favorite

  end
  it 'exists' do
    expect(@facade).to be_a(FavoritesFacade)
  end

  describe "instance methods" do
    it '#create_favorite' do
      expect(@favorite).to be_a(Favorite)
      expect(@favorite.user).to eq(@user)
      expect(@favorite.location.address).to eq(@address)
    end

    it '#remove_favorite' do
      expect(@user.locations.count).to eq(3)
      expect(@user.locations.last.address).to eq("denver,co")
      @facade.remove_favorite
      expect(@user.favorites.count).to eq(2)
      expect(@user.locations.last.address).to_not eq("denver,co")
    end


    it '#all_favorites' do
      expect(@facade.all_favorites(@user)).to be_a(Array)
      expect(@facade.all_favorites(@user).first).to be_a(Weather)
    end
  end
end
