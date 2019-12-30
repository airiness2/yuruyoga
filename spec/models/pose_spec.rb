require 'rails_helper'

RSpec.describe Pose, type: :model do
  it 'is valid with a name' do
    pose = Pose.new(
      name: 'ポーズ2',
      detail: 'ポーズ詳細2',
      sans_name: 'ポーズ2-1',
      image: nil
    )
    expect(pose).to be_valid
  end
end
