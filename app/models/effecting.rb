class Effecting < ApplicationRecord
  belongs_to :pose, optional: true
  belongs_to :effect, optional: true
end
