require 'rails_helper'

RSpec.describe Location, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
  end

  describe 'class methods' do

  end


end
