class Diary < ApplicationRecord
  validates :worked_date, presence: true
  validates :rank, presence: true

  belongs_to :pose
  has_many :taggings, dependent: :destroy

  mount_uploader :image, ImageUploader
end
