require 'rails_helper'

describe Antipode do
  before :each do
    data = {:id=>"1", :summary=>"Clear", :temp=>60.29, :location=>"America/La_Paz"}
    @antipode = Antipode.new(data, "hongkong")
  end

  it 'exists' do
    expect(@antipode).to be_a(Antipode)
  end

  it 'has attributes' do
    expect(@antipode.id).to eq("1")
    expect(@antipode.summary).to eq("Clear")
    expect(@antipode.location_name).to eq("La Paz")
    expect(@antipode.temp).to eq(60.29)
    expect(@antipode.search_location).to eq('Hongkong')
  end

end
