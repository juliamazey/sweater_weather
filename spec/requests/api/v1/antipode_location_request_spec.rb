require 'rails_helper'

describe 'Amypode API' do
  it 'sends the antipode information of a place' do

    get '/api/v1/antipode?loc=hongkong'

    expect(response).to be_successful

    antipode = JSON.parse(response.body)
  end
end
