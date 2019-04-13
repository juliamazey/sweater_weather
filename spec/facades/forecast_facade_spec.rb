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
    end
  end
end
