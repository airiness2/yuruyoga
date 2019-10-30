class Effect < ApplicationRecord
  has_many :effectings, dependent: :destroy
  has_many :poses, through: :effectings, source: :pose
end
