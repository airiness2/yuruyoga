require 'rails_helper'

RSpec.describe Diary, type: :model do
  it "is valid with a worked_date, rank" do
    diary = Diary.new(
      title: 'テスト',
      worked_date: nil,
      body: '本文',
      rank: 5,
      image: nil)
    expect(diary).not_to be_valid
  end
end
