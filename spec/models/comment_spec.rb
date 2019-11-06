require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is valid with a content" do
    diary = FactoryBot.create(:diary)
    comment = diary.comments.build(
      diary_id: "1",
      content: "コメント"
      )
    expect(comment).to be_valid
  end
end
