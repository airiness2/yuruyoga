require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name, email, admin, password" do
    user = User.new(
      name: 'ユーザ1',
      email: 'test1@example.com',
      admin: false,
      password: 'password',
      password_confirmation: 'password',
      avatar: nil)
    expect(user).to be_valid
  end
end
