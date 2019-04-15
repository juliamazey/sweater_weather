class Antipode
  attr_reader :id,
              :search_location

  def initialize(data, address)
    @id = data[:id]
    @forecast = data[:attributes]
    @location_name = data[:location].split("/").last.sub("_", " ")
    @search_location = address.capitalize
  end

  def attributes
    { location_name: @location_name,
      forecast: forecast }
  end

  def forecast
    { summary: @forecast[:summary], current_temperature: @forecast[:temperature]}
  end

end
