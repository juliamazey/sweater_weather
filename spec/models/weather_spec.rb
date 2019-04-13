require 'rails_helper'

describe Weather do
  before :each do
    file = File.open('./fixtures/forecast_data.json')
    data = JSON.parse(file.read, symbolize_names:true)
    @weather = Weather.new(data, 'Denver, CO')
  end

  it 'exists' do
    expect(@weather).to be_a(Weather)
  end

  it 'has attributes' do
    expect(@weather.summary).to eq('Mostly Cloudy')
    expect(@weather.humidity).to eq(0.55)
    expect(@weather.temperature).to eq(44.1)
    expect(@weather.apparent_temperature).to eq(44.1)
    expect(@weather.visibility).to eq(7.13)
    expect(@weather.uv_index).to eq(2)
    expect(@weather.tonight_summary).to eq('Light rain on Wednesday, with high temperatures rising to 77°F next Saturday.')
    expect(@weather.today_summary).to eq('Mostly cloudy until evening.')
    expect(@weather.address).to eq('Denver, CO')
    expect(@weather.max_temp).to eq(47.08)
    expect(@weather.min_temp).to eq(30.07)
  end
end
