require 'rails_helper'

describe WeatherWeekly do
  before :each do
    file = File.open('./fixtures/forecast_data.json')
    file_data = JSON.parse(file.read, symbolize_names:true)
    data = file_data[:daily][:data][1]
    @weather = WeatherWeekly.new(data)
  end

  it 'exists' do
    expect(@weather).to be_a(WeatherWeekly)
  end

  it 'has attributes' do
    expect(@weather.time).to eq("04 PM")
    expect(@weather.temperature).to eq(43.75)
  end
end
