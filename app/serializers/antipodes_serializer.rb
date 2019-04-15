class AntipodesSerializer
  include FastJsonapi::ObjectSerializer

  attributes :location_name

  attribute :forecast do |object|
    object.forecast
  end

  attribute :search_location do |object|
    object.search_location
  end

end
