require 'rails_helper'

describe 'Sessions API' do
  it 'sends back the api key for the user account' do

    user = create(:user)

    post '/api/v1/sessions', params: {email: user.email,
                                      password: user.password,
                                      }

    expect(response).to be_successful
    expect(response.status).to eq(200)

    key = JSON.parse(response.body)

    expect(key["api_key"]).to eq(user.api_key)
  end
end
