class Attendance < ApplicationRecord
  # 関連付け
  belongs_to :user
  belongs_to :lesson
end
