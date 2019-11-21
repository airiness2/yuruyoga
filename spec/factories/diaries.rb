FactoryBot.define do
  factory :diary do
    title { "日記1" }
    worked_date { "2019-10-20" }
    body { "日記本文1" }
    rank { 1 }
    image { nil }
    pose_id { 1 }
    user_id { 1 }
    pose
    user
  end
end
