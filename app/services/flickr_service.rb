class FlickrService

  def get_url(geo_data)
    JSON.parse(response(geo_data).body, symbolize_names: true)
  end

  def response(geo_data)
    conn.get do |req|
      req.url '/services/rest/'
      req.params['method'] = 'flickr.photos.search'
      req.params['api_key'] = ENV['FLICKR_KEY']
      req.params['tags'] = 'sun,snow,nature,green,winter,trees,lake'
      req.params['accuracy'] = 11
      req.params['safe_search'] = 1
      req.params['lat'] = geo_data[:lat]
      req.params['lon'] = geo_data[:lng]
      req.params['format'] = 'json'
      req.params['nojsoncallback'] = 1
      req.params['per_page'] = 1
      req.params['page'] = 1
      req.params['media'] = 'photos'
      req.params['extras'] = 'url_c'
    end
  end

  def conn
    Faraday.new(url: 'https://api.flickr.com') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

end
