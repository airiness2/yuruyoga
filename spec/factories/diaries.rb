FactoryBot.define do
  factory :diary do
    title { "タイトル" }
    worked_date { "2019-10-20" }
    body { "本文" }
    rank { 1 }
    image { nil }
    pose_id { 1 }
    user_id { 1 }
    pose
    user
  end
end
