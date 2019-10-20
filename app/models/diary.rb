class Diary < ApplicationRecord
  validates :worked_date, presence: true
  validates :rank, presence: true
end
