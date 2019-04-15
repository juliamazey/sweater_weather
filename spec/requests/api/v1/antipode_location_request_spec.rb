require 'rails_helper'

describe 'Amypode API' do
  it 'sends the antipode information of a place' do

    get '/api/v1/antipode?loc=hongkong'

    expect(response).to be_successful

    antipode = JSON.parse(response.body)
    # binding.pry
    # result = {"data": [{"id": "1",
    #                     "type": "antipode",
    #                     "attributes": {"location_name": "Antipode City Name",
    #                                    "forecast": {"summary": "Mostly Cloudy,
    #                                                 "current_temperature": "72"},
    #                                    "search_location": "Hong Kong"}
    #                   ]}
    #           }
  end
end
