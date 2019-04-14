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
    it '#location' do
      facade_location = @facade.location
      expect(facade_location).to be_a(Location)
    end
  end
end
