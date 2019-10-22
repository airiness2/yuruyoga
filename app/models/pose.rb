class Pose < ApplicationRecord
  validates :name, presence: true

  has_many :diaries, dependent: :destroy
end
