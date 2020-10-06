class Lesson < ApplicationRecord
  # 関連付け
  belongs_to :teacher
  has_many :attendance
  mount_uploader :lessonImage, AvatarUploader
end
