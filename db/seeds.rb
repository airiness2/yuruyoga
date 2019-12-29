# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "admin", email: "admin@example.com", password: "password", admin: true, confirmed_at: Time.now)

3.times do |index|
  User.create(name: "user#{index}", email: "user#{index}@example.com", password: "password", admin: false, confirmed_at: Time.now)
end

Effect.create(name: "肩こり")
Effect.create(name: "リラックス")
Effect.create(name: "便秘解消")

Pose.create(name: "子どものポーズ", detail: "心と体に安らぎを与えるポーズ", sans_name: "バーラアーサナ", effect_ids: [2])
Pose.create(name: "屍のポーズ", detail: "究極のリラクゼーションポーズ", sans_name: "シャヴァーサナ", effect_ids: [2])
Pose.create(name: "舟のポーズ", detail: "体をVの字にしてバランスを取るポーズ", sans_name: "ナーヴァーサナ", effect_ids: [3])
Pose.create(name: "下向きの犬のポーズ", detail: "犬が伸びをするように全身を伸ばすポーズ", sans_name: "アドームカシュヴァーナーサナ", effect_ids: [1, 2])
Pose.create(name: "三角のポーズ", detail: "上体を倒し、ウエストを強く伸ばすポーズ", sans_name: "ウッティタートリコナーサナ", effect_ids: [3])

Tag.create(name: "初心者")
Tag.create(name: "ハード")
Tag.create(name: "ハッピー")

Diary.create(title: "日記サンプル1", worked_date: Time.now, body: "日記のサンプルです", pose_id: 1, user_id: 1)
