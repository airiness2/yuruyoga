require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'is valid with a content and user_id' do
    diary = FactoryBot.create(:diary)
    user = FactoryBot.create(:user, email: 'test10@example.com')
    comment = diary.comments.build(
      diary_id: '1',
      content: 'コメント',
      user_id: user.id
    )
    expect(comment).to be_valid
  end
end
