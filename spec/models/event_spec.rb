require 'rails_helper'

RSpec.describe Event, type: :model do
  it "is valid with a name, hold_date, user_id" do
    user = FactoryBot.create(:user)
    event = Event.new(
      name: 'イベント1',
      detail: 'イベント詳細1',
      hold_date: '2019/11/30 15:00',
      place: "東京",
      user_id: "1",
      url: nil)
    expect(event).to be_valid
  end
end
