FactoryBot.define do
  factory :user do
    profile_id { 1 }
    role_id { 1 }
    phone { Faker::Number.numerify('#' * 10) }
    password { Faker::String.random(length: 7..12) }
  end
end
