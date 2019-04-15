require 'rails_helper'

describe FlickrService do
  before :each do
    @service = FlickrService.new
  end

  it 'exists' do
    expect(@service).to be_a(FlickrService)
  end

  it 'can get image' do
    geo_data = {lat: 39.7392358, lng: -104.990251}
    result = @service.get_url(geo_data)
    expect(result).to be_a(Hash)
    expect(result[:photos][:photo][0]).to have_key(:url_c)
  end
end
