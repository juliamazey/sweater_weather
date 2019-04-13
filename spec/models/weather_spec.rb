require 'rails_helper'

describe Weather do
  before :each do
    file = File.open('./fixtures/forecast_data.json')
    data = JSON.parse(file.read, symbolize_names:true)
    @weather = Weather.new(data)
  end

  it 'exists' do
    expect(@weather).to be_a(Weather)
  end

  it 'has attributes' do
    expect(@weather.summary).to eq('Mostly Cloudy')
    expect(@weather.humidity).to eq(0.55)
    expect(@weather.temperature).to eq(44.1)
    expect(@weather.apparent_temperature).to eq(44.1)
    expect(@weather.uv_index).to eq(2)
    expect(@weather.tonight_summary).to eq('Light rain on Wednesday, with high temperatures rising to 77°F next Saturday.')
  end
end
