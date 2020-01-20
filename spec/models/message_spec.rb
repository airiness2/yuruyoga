require 'rails_helper'

RSpec.describe Message, type: :model do
  it 'is valid with a body' do
    user = FactoryBot.create(:user, name: "messagetest1", email: 'messagetest1@example.com')
    user2 = FactoryBot.create(:user, name: "messagetest2", email: 'messagetest2@example.com')
    conversation = Conversation.create(
      sender_id: user.id,
      recipient_id: user2.id
    )
    message = conversation.messages.build(
      user_id: user2.id,
      conversation_id: '1',
      read: true,
      body: 'メッセージ'
    )
    expect(message).to be_valid
  end
end
