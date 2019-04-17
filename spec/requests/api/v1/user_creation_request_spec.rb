require 'rails_helper'

describe 'User API' do
  it 'sends back an api key' do

    post '/api/v1/users', params: {email: "whatever@example.com",
                                   password: "password",
                                   password_confirmation: "password"
                                  }

    expect(response).to be_successful
    expect(response.status).to eq(201)

    key = JSON.parse(response.body)
  end

  it 'sends back a 400 status if invalid' do

    post '/api/v1/users', params: {email: "whatever@example.com",
                                   password: "password",
                                   password_confirmation: "invalid"
                                  }

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
  end
end
