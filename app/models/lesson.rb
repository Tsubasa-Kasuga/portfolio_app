class Lesson < ApplicationRecord
  # 関連付け
  belongs_to :teacher
  has_many :attendance
end
