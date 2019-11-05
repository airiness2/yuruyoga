require 'rails_helper'

RSpec.describe Message, type: :model do
  it "is valid with a name" do
    conversation = FactoryBot.create(:conversation)
    message = conversation.messages.build(
      user_id: "2",
      conversation_id: "1",
      read: true,
      body: "メッセージ"
      )
    expect(message).to be_valid
  end
end
