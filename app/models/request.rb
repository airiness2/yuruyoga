class Request < ApplicationRecord
  belongs_to :user
  enum status: { "未着手": 0, "対応中": 1, "完了": 2 }
end
