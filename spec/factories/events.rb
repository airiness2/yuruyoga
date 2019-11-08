FactoryBot.define do
  factory :event do
    name { "イベント1" }
    hold_date { "2019-09-29 13:00:00" }
    place { "渋谷" }
    url { "http://localhost" }
    detail { "イベント詳細1" }
    user_id { 1 }
    user
  end
end
