require 'rails_helper'

describe 'Favorites API' do
  it 'adds a location to a user and sends back its api key' do

    api_key = SecureRandom.urlsafe_base64

    user = User.create!(email: "whatever@example.com",
                        password: "password",
                        password_confirmation: "password",
                        api_key: api_key
                        )

    post '/api/v1/favorites', params: {location: "Denver, CO",
                                        api_key: api_key,
                                        }

    expect(response).to be_successful

    key = JSON.parse(response.body)
    expect(key).to eq(api_key)
  end
end
