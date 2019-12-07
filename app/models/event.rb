class Event < ApplicationRecord
  validates_datetime :hold_date

  belongs_to :user
end
