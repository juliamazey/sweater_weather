require 'rails_helper'

describe 'Flickr API' do
  it 'sends background image of a place' do

    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    image = JSON.parse(response.body)
    binding.pry
  end
end
