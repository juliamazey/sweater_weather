require 'rails_helper'

describe GeocodeService do
  before :each do
    @service = GeocodeService.new
  end

  it 'exists' do
    expect(@service).to be_a(GeocodeService)
  end

  it 'can get latitude and longitude' do
    result = @service.get_lat_long('denver,co')
    expect(result).to be_a(Hash)
    expect(result).to have_key(:results)
  end
end
