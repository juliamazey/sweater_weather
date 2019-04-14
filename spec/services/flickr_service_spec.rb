require 'rails_helper'

describe FlickrService do
  before :each do
    @service = FlickrService.new
  end

  it 'exists' do
    expect(@service).to be_a(FlickrService)
  end

  it 'can get image' do
    result = @service.get_url(39.7392358, -104.990251)
    expect(result).to be_a(Hash)
    expect(result).to have_key(:url_o)
  end
end
