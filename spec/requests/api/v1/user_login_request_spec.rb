require 'rails_helper'

describe 'Sessions API' do
  it 'sends back the api key for the user account' do

    post '/api/v1/sessions', params: {email: "whatever@example.com",
                                      password: "password",
                                      }

    expect(response).to be_successful

    key = JSON.parse(response.body)
  end
end
