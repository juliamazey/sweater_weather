require 'rails_helper'

describe AmypodeService do
  before :each do
    @service = AmypodeService.new
    @location = create(:location, latitude: 22.3193039, longitude: 114.1693611)
  end

  it 'exists' do
    expect(@service).to be_a(AmypodeService)
  end

  it 'can get antipodes location' do
    result = @service.find_antipodes(@location)
    expect(result).to be_a(Hash)
    expect(result[:data][:type]).to eq("antipode")
    expect(result[:data][:attributes]).to have_key(:lat)
    expect(result[:data][:attributes]).to have_key(:long)
  end
end
