class GeocodeService

  def get_lat_long(address)
    JSON.parse(response(address).body, symbolize_names: true)
  end

  def response(address)
    conn.get do |req|
      req.url '/maps/api/geocode/json'
      req.params['address'] = address
      req.params['key'] = ENV['GEOCODING_API']
    end
  end

  def conn
    Faraday.new(url: 'https://maps.googleapis.com') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

end
