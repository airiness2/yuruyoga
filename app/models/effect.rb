class Effect < ApplicationRecord
  has_many :effectings, dependent: :destroy, foreign_key: 'effect_id'
  has_many :poses, through: :effectings, source: :pose

  validates :name, presence: true, uniqueness: true
end
