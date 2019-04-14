require 'rails_helper'

describe ImageFacade do
  before :each do
    @address = "denver,co"
    @facade = ImageFacade.new(@address)
  end
  it 'exists' do
    expect(@facade).to be_a(ImageFacade)
  end

  describe "instance methods" do
    it '#url' do
      facade_url = @facade.url
      expect(facade_url[:id]).to eq('47499079331')
      expect(facade_url[:url_o]).to eq('https://live.staticflickr.com/7830/47499079331_efb11bea63_o.jpg')
    end
  end
end
