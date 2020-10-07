class Lesson < ApplicationRecord
  # 関連付け
  belongs_to :teacher
  has_many :attendance
  mount_uploader :lessonImage, AvatarUploader

  enum frequency:{
    ワンポイントレッスン: 0,
    月4回コース: 1,
    月2回コース: 2
  }
end
