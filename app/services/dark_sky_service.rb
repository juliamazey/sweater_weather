class DarkSkyService

  def get_forecast(lat, long)
    JSON.parse(response(lat, long).body, symbolize_names: true)
  end

  def response(lat, long)
    conn.get do |req|
      req.url "/forecast/#{ENV['DARK_SKY_API']}/#{lat},#{long}"
      req.params['exclude'] = '[minutely,flags]'
    end
  end

  def conn
    Faraday.new(url: 'https://api.darksky.net') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def create_antipode(data, address)
    [Antipode.new(data, address)]
  end

end
