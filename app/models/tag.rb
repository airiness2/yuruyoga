class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy, foreign_key: 'tag_id'
  has_many :diaries, through: :taggings, source: :tag
  
  validates :name, presence: true, uniqueness: true
end
