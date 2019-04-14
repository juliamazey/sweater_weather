require 'rails_helper'

describe ForecastFacade do
  before :each do
    @address = "denver,co"
    @facade = ForecastFacade.new(@address)
  end
  it 'exists' do
    expect(@facade).to be_a(ForecastFacade)
  end

  describe "instance methods" do
    it '#geo_data' do
      data = @facade.geo_data
      expect(data[:lat]).to eq(39.7392358)
      expect(data[:lng]).to eq(-104.990251)
    end

    it '#get_location' do
      location = @facade.get_location
      expect(location.address).to eq(@address)
      expect(location.latitude).to eq(39.7392358)
      expect(location.longitude).to eq(-104.990251)
    end

    it '#get_forecast_data' do
      forecast_data = @facade.get_forecast_data(39.7392358, -104.990251)
      expect(forecast_data).to have_key(:currently)
    end

    it '#weather_today' do
      expect(@facade.weather_today).to be_a(Weather)
    end

    it '#weather hourly' do
      hourly = @facade.weather_hourly
      expect(hourly).to be_a(Array)
      expect(hourly.count).to eq(8)
    end

    it '#weather_weekly' do
      weekly = @facade.weather_weekly
      expect(weekly).to be_a(Array)
      expect(weekly.count).to eq(5)
    end
  end
end
