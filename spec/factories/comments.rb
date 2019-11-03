FactoryBot.define do
  factory :comment do
    diary { nil }
    content { "MyText" }
  end
end
