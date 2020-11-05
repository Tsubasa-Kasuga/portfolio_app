class Lesson < ApplicationRecord
  # 関連付け
  belongs_to :teacher
  has_many :attendance
  mount_uploader :lessonImage, AvatarUploader

  # バリデーション
  validates :title, presence: true, length: { minimum: 5, maximum: 20 }
  validates :description, presence: true, length: { minimum: 50, maximum: 2000 }
  validates :frequency, presence: true
  validates :time, presence: true
  validates :price, presence: true

  enum frequency: {
    １回コース: 0,
    月２回コース: 1,
    月４回コース: 2,
  }
  enum time: {
    １５分: 0,
    ３０分: 1,
    ４５分: 2,
    ６０分: 3,
  }
  enum price: {
    ５００: 0,
    １０００: 1,
    ２０００: 2,
    ３０００: 3,
    ４０００: 4,
    ５０００: 5,
    ６０００: 6,
    ７０００: 7,
    ８０００: 8,
    ９０００: 9,
    １００００: 10,
    １5０００: 11,
    ２００００: 12,
  }
end
