require 'rails_helper'

describe 'Forecast API' do
  it 'sends forecast information of a place' do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    forecast = JSON.parse(response.body)
  end
end
