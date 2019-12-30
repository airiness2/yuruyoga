FactoryBot.define do
  factory :user do
    name { 'test' }
    email { 'test@example.com' }
    password { 'password' }
    admin { false }

    confirmed_at { Time.now }

    trait :admin_user do
      admin { true }
    end
  end
end
