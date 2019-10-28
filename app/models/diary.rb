class Diary < ApplicationRecord
  validates :worked_date, presence: true
  validates :rank, presence: true

  belongs_to :pose
  belongs_to :user
  has_many :taggings, dependent: :destroy, foreign_key: 'diary_id'
  has_many :tags, through: :taggings, source: :tag

  mount_uploader :image, ImageUploader
end
