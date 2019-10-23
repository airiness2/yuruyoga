class Effect < ApplicationRecord
  has_many :effectings, dependent: :destroy
end
