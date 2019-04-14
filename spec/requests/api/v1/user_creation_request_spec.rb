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
end
