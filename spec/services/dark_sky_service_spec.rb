require 'rails_helper'

describe DarkSkyService do
  before :each do
    @service = DarkSkyService.new
  end

  it 'exists' do
    expect(@service).to be_a(DarkSkyService)
  end

  it 'can get forecast' do
    result = @service.get_forecast(39.7392358, -104.990251)
    expect(result).to be_a(Hash)
    expect(result).to have_key(:latitude)
    expect(result).to have_key(:longitude)
  end
end
