class ImageSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id,
             :address,
             :latitude,
             :longitude,
             :image_url

end
