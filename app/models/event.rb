class Event < ApplicationRecord
  validates_datetime :hold_date
  
  validates :name, presence: true
  validates :place, presence: true

  belongs_to :user
end
