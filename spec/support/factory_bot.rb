FactoryBot.define do
  factory :user do
    profile_id { 1 }
    role_id { 1 }
    phone { '0123456789' }
    password { 'valid_password' }
  end
end
