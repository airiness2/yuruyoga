require 'rails_helper'

RSpec.describe Tag, type: :model do
  it "is valid with a name" do
    tag = Tag.new(
      name: 'タグ1'
    )
    expect(tag).to be_valid
  end
end
