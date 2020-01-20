FactoryBot.define do
  factory :request do
    before(:create) do
      FactoryBot.create(:user, name: "request", email: 'request@example.com')
    end
    status { 1 }
    body { '要望のテストです' }
    user { User.first }
  end
end
