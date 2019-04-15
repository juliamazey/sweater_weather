class AmypodeService

  def find_antipodes(location)
    result = JSON.parse(response(location).body, symbolize_names: true)
  end

  def response(location)
    conn.get do |req|
      req.url '/api/v1/antipodes'
      req.headers['api_key'] = ENV['API_KEY']
      req.params['lat'] = location.latitude
      req.params['long'] = location.longitude
    end
  end

  def conn
    Faraday.new(url: 'http://amypode.herokuapp.com') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

end
