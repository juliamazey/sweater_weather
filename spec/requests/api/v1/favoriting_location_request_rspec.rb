require 'rails_helper'

describe 'Favorites API' do
  before :each do
    @api_key = SecureRandom.urlsafe_base64

    @user = User.create!(email: "whatever@example.com",
                        password: "password",
                        password_confirmation: "password",
                        api_key: @api_key
                        )
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

end
