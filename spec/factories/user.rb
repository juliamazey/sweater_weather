FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@email.com" }
    sequence(:api_key) { |n| "user_#{n}_key" }
    sequence(:password) { |n| "user_#{n}_password" }
  end
end
