require 'rails_helper'

describe Antipode do
  before :each do
    data = {:id=>"1",
            :type=>"antipode",
            :location=> 'America/La_Paz',
            :attributes=>
                  {:time=>1555344060,
                   :summary=>"Clear",
                   :icon=>"clear-day",
                   :precipIntensity=>0,
                   :precipProbability=>0,
                   :temperature=>57.96,
                   :apparentTemperature=>57.96,
                   :dewPoint=>28.78,
                   :humidity=>0.33,
                   :pressure=>1013.66,
                   :windSpeed=>4.85,
                   :windGust=>6.78,
                   :windBearing=>22,
                   :cloudCover=>0,
                   :uvIndex=>12,
                   :visibility=>9.97,
                   :ozone=>239.33}}
    @antipode = Antipode.new(data, "hongkong")
  end

  it 'exists' do
    expect(@antipode).to be_a(Antipode)
  end

  it 'has attributes' do
    expect(@antipode.id).to eq("1")
    expect(@antipode.type).to eq('antipode')
    expect(@antipode.location_name).to eq("La Paz")
    expect(@antipode.forecast).to eq({summary: "Clear", current_temperature: 57.96})
    expect(@antipode.search_location).to eq('Hongkong')
  end


end
