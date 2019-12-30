require 'rails_helper'

RSpec.describe Request, type: :model do
  it "is valid with a body" do
    user = FactoryBot.create(:user, email: "request@example.com")
    request = Request.new(
      status: 1,
      body: '要望1',
      user_id: user.id
    )
    expect(request).to be_valid
  end
end
