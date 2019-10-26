class Pose < ApplicationRecord
  validates :name, presence: true

  has_many :diaries, dependent: :destroy
  has_many :effectings, dependent: :destroy

  scope :autocomplete, ->(term) { where("name LIKE ?", "#{term}%").order(:name) }
end
