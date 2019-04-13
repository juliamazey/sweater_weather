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
  end
end
