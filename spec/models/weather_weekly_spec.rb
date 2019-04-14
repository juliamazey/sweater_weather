require 'rails_helper'

describe WeatherWeekly do
  before :each do
    file = File.open('./fixtures/forecast_data.json')
    file_data = JSON.parse(file.read, symbolize_names:true)
    data = file_data[:daily][:data][1]
    @weather = WeatherWeekly.new(data, 1)
  end

  it 'exists' do
    expect(@weather).to be_a(WeatherWeekly)
  end

  it 'has attributes' do
    expect(@weather.id).to eq(1)
    expect(@weather.day).to eq('Sunday')
    expect(@weather.summary).to eq('Mostly cloudy throughout the day.')
    expect(@weather.icon).to eq('partly-cloudy-day')
    expect(@weather.rain_prob).to eq(0.01)
    expect(@weather.max_temp).to eq(66.06)
    expect(@weather.min_temp).to eq(31.22)
  end
end
