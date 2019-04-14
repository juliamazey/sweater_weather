require 'rails_helper'

describe 'Favorites API' do
  before :each do
    @api_key = SecureRandom.urlsafe_base64

    @user = User.create!(email: "whatever@example.com",
                        password: "password",
                        password_confirmation: "password",
                        api_key: @api_key
                        )

    @location_1 = Location.create(address: "Miami, FL",
                                  latitude: 25.7616798,
                                  longitude: -80.1917902,
                                  image_url: "https://live.staticflickr.com/7823/32636839757_504eac971e_o.jpg"
                                  )

    @location_2 = Location.create(address: "New York, NY",
                                  latitude: 40.7127753,
                                  longitude: -74.0059728,
                                  image_url: "https://live.staticflickr.com/7829/47545665492_88f501160a_o.jpg"
                                  )
    @favorite_1 = Favorite.create(user: @user, location: @location_1)
    @favorite_2 = Favorite.create(user: @user, location: @location_2)
  end

  it 'adds a favorite to a user' do

    post '/api/v1/favorites', params: {location: "Denver, CO",
                                        api_key: @api_key
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

    get '/api/v1/favorites', params: {api_key: @api_key}

    expect(response).to be_successful
    fav = JSON.parse(response.body, symbolize_names: true)

    expect(fav[:today][:data][0][:attributes][:address]).to eq("Miami,  FL")
    expect(fav[:today][:data][0][:attributes]).to have_key(:temperature)
  end
end
