class AntipodesSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id,
             :search_location

  attribute :attributes do |object|
    object.attributes
  end

end
