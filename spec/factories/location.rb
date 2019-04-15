FactoryBot.define do
  factory :location do
    sequence(:address) { Faker::Address.city }
    sequence(:latitude) { Faker::Address.latitude }
    sequence(:longitude) { Faker::Address.longitude }
    sequence(:image_url) { "https://live.staticflickr.com/7830/47499079331_efb11bea63_o.jpg" }
  end
end
