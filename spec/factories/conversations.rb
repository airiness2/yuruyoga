FactoryBot.define do
  factory :conversation do
    before(:create) do
      FactoryBot.create(:user, email: "test100@example.com")
      FactoryBot.create(:user, email: "test101@example.com")
    end
    sender_id { "1" }
    recipient_id { "2" }
  end
end
