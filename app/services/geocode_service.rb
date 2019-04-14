class GeocodeService

  def get_lat_long(address)
    JSON.parse(response(address).body, symbolize_names: true)
  end

  def response(address)
    conn.get("/maps/api/geocode/json?address=#{address}&key=#{ENV['GEOCODING_API']}")
  end

  def conn
    Faraday.new(url: 'https://maps.googleapis.com') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

end
