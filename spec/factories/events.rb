FactoryBot.define do
  factory :event do
    name { "MyString" }
    hold_date { "2019-11-07 15:25:21" }
    place { "MyString" }
    url { "MyString" }
    detail { "MyText" }
    user { nil }
  end
end
