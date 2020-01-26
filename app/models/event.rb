class Event < ApplicationRecord
  validates_datetime :hold_date, :on_or_after => lambda { Date.today }
  
  validates :name, presence: true
  validates :place, presence: true

  belongs_to :user
end
