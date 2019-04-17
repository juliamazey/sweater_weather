require 'rails_helper'

describe 'Favorites API' do
  before :each do
    @user = create(:user)
    @location_1, @location_2 = create_list(:location, 2)
    @favorite_1 = create(:favorite, user: @user, location: @location_1)
    @favorite_2 = create(:favorite, user: @user, location: @location_2)
  end

  it 'adds a favorite to a user' do

    post '/api/v1/favorites', params: {location: "Denver, CO",
                                        api_key: @user.api_key
                                        }
    expect(response).to be_successful
    expect(response.status).to eq(201)
  end

  it 'returns 401 if no valid API key' do

    post '/api/v1/favorites', params: {location: "Denver, CO",
                                        api_key: SecureRandom.urlsafe_base64
                                        }
    expect(response).to_not be_successful
    expect(response.status).to eq(401)
  end

  it 'sends a list of favorite locations' do
    file = File.open('./fixtures/favorites_example.json')
    result = JSON.parse(file.read, symbolize_names:true)

    get '/api/v1/favorites', params: {api_key: @user.api_key}
    expect(response).to be_successful

    fav = JSON.parse(response.body, symbolize_names:true)
    address = fav[:today][:data][0][:attributes][:address].split(",").first.upcase

    expect(address).to eq(@user.locations.first.address.upcase)
    expect(fav[:today][:data][0][:attributes]).to have_key(:temperature)
  end

  it 'also returns 401 if no valid API key' do

    get '/api/v1/favorites', params: {api_key: SecureRandom.urlsafe_base64}
    expect(response).to_not be_successful
    expect(response.status).to eq(401)
  end

  it 'can remove a favorite location' do

    delete '/api/v1/favorites', params: {location: @user.locations.first.address,
                                         api_key: @user.api_key
                                         }

    expect(response).to be_successful
    fav = JSON.parse(response.body, symbolize_names: true)

    expect(fav[:today][:data][0][:attributes][:address]).to_not eq(@user.locations.first.address)
    expect(fav[:today][:data][0][:attributes]).to have_key(:temperature)
  end


  it 'will also return 401 if no valid API key' do

    delete '/api/v1/favorites', params: {location: "Miami, FL",
                                         api_key: SecureRandom.urlsafe_base64}
    expect(response).to_not be_successful
    expect(response.status).to eq(401)
  end

end
