class Pose < ApplicationRecord
  validates :name, presence: true

  has_many :diaries, dependent: :destroy
  has_many :effectings, dependent: :destroy, foreign_key: 'pose_id'
  has_many :effects, through: :effectings, source: :effect

  scope :autocomplete, ->(term) { where("name LIKE ?", "#{term}%").order(:name) }
  mount_uploader :image, PoseImageUploader
end
