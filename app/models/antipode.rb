class Antipode
  attr_reader :id,
              :search_location,
              :summary,
              :temp,
              :location_name

  def initialize(data, address)
    @id = data[:id]
    @summary = data[:summary]
    @temp = data[:temp]
    @location_name = data[:location].split("/").last.sub("_", " ")
    @search_location = address.capitalize
  end

  def attributes
    { location_name: @location_name,
      forecast: forecast }
  end

  def forecast
    { summary: @summary, current_temperature: @temp}
  end

end
