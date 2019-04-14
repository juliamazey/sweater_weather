require 'rails_helper'

describe WeatherHourly do
  before :each do
    file = File.open('./fixtures/forecast_data.json')
    file_data = JSON.parse(file.read, symbolize_names:true)
    data = file_data[:hourly][:data][0]
    @weather = WeatherHourly.new(data, 1)
  end

  it 'exists' do
    expect(@weather).to be_a(WeatherHourly)
  end

  it 'has attributes' do
    expect(@weather.time).to eq("04 PM")
    expect(@weather.temperature).to eq(43.75)
    expect(@weather.id).to eq(1)
    expect(@weather.icon).to eq('partly-cloudy-day')
  end
end
