require 'rails_helper'

describe FavoritesFacade do
  before :each do
    @user = User.create!(email: "whatever@example.com",
                        password: "password",
                        password_confirmation: "password",
                        api_key: SecureRandom.urlsafe_base64
                        )
    @address = 'denver,co'
    @facade = FavoritesFacade.new(@user, @address)
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
  end
end
