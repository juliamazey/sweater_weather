require 'rails_helper'

describe FavoritesFacade do
  before :each do
    @address = 'denver,co'
    @user = create(:user)
    @facade = FavoritesFacade.new(@user, @address)
    @location_1, @location_2 = create_list(:location, 2)
    @favorite_1 = create(:favorite, user: @user, location: @location_1)
    @favorite_2 = create(:favorite, user: @user, location: @location_2)
  end
  it 'exists' do
    expect(@facade).to be_a(FavoritesFacade)
  end

  describe "instance methods" do
    it '#create_favorite' do
      favorite = @facade.create_favorite
      expect(favorite).to be_a(Favorite)

      expect(favorite.user).to eq(@user)
      expect(favorite.location.address).to eq(@address)
    end

    it '#all_favorites' do
      expect(@facade.all_favorites(@user)).to be_a(Array)
      expect(@facade.all_favorites(@user).first).to be_a(Weather)
    end
  end
end
