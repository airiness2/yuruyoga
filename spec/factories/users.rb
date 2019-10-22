FactoryBot.define do
  factory :user do
    name { "test" }
    email { "test@example.com" }
    password { "password" }

    confirmed_at { Time.now }
  end
end
