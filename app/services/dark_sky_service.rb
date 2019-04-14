class DarkSkyService

  def get_forecast(lat, long)
    JSON.parse(response(lat, long).body, symbolize_names: true)
  end

  def response(lat, long)
    conn.get("/forecast/#{ENV['DARK_SKY_API']}/#{lat},#{long}?exclude=[minutely,flags]")
  end

  def conn
    Faraday.new(url: 'https://api.darksky.net') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

end
