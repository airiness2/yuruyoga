FactoryBot.define do
  factory :event do
    name { 'イベント1' }
    hold_date { Time.now.tomorrow.to_date }
    place { '渋谷' }
    url { 'http://localhost' }
    detail { 'イベント詳細1' }
    user_id { 1 }
    user
  end
end
