require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'is valid with a name, hold_date, user_id' do
    user = FactoryBot.create(:user, email: 'test11@example.com')
    event = Event.create(
      name: 'イベント1',
      detail: 'イベント詳細1',
      hold_date:  Time.now.tomorrow.to_date,
      place: '東京',
      user_id: user.id,
      url: nil
    )
    expect(event).to be_valid
  end
end
