require 'rails_helper'

RSpec.describe Location, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
    it { should validate_presence_of(:image_url) }
  end

  describe 'relationships' do
    it { should have_many :favorites }
    it { should have_many(:users).through(:favorites) }
  end

  describe 'class methods' do
    it '.create_location' do
      address = 'denver,co'
      geo_data = {lat: 39.7392358, lng: -104.990251}
      url = "https://live.staticflickr.com/7830/47499079331_efb11bea63_o.jpg"

      location = Location.create_location(address, geo_data, url)
      expect(location).to be_a(Location)
      expect(location.address).to eq(address)
      expect(location.latitude).to eq(geo_data[:lat])
      expect(location.longitude).to eq(geo_data[:lng])
      expect(location.image_url).to eq(url)
    end
  end


end
