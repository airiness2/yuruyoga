FactoryBot.define do
  factory :request do
    status { 1 }
    body { "MyText" }
    user { nil }
  end
end
