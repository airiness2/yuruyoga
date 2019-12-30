require 'rails_helper'

RSpec.describe Effect, type: :model do
  it 'is valid with a name' do
    effect = Effect.new(
      name: '効果1'
    )
    expect(effect).to be_valid
  end
end
