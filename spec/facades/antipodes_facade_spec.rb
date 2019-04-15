require 'rails_helper'

describe AntipodesFacade do
  before :each do
    @address = 'hongkong'
    @facade = AntipodesFacade.new(@address)
  end
  it 'exists' do
    expect(@facade).to be_a(AntipodesFacade)
  end

  describe "instance methods" do
    it '#get_antipodes' do
      result = @facade.get_antipodes
      # binding.pry
    end
  end
end
