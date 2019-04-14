class FlickrService

  def get_url(geo_data)
    JSON.parse(response(geo_data).body, symbolize_names: true)
  end

  def response(geo_data)
    conn.get("/services/rest/?method=flickr.photos.search&api_key=#{ENV['FLICKR_KEY']}&tags=sun,snow,nature,green,winter,trees,lake&accuracy=11&safe_search=1&lat=#{geo_data[:lat]}&lon=#{geo_data[:lng]}&format=json&nojsoncallback=1&per_page=1&page=1&media=photos&extras=url_o")
  end

  def conn
    Faraday.new(url: 'https://api.flickr.com') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

end
