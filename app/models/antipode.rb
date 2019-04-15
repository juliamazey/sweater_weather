class Antipode
  attr_reader :id,
              :type,
              :location_name,
              :search_location

  def initialize(data, address)
    @id = data[:id]
    @type = data[:type]
    @forecast = data[:attributes]
    @location_name = data[:location].split("/").last.sub("_", " ")
    @search_location = address.capitalize
  end

  def forecast
    { summary: @forecast[:summary], current_temperature: @forecast[:temperature]}
  end

end
