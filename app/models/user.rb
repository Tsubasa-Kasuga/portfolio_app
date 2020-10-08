class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 関連付け
  has_many :user
  has_many :attendance
  mount_uploader :avatar, AvatarUploader
  # バリデーション
  validates :name, presence: true
  validates :birth_date, presence: true
  validates :sex, presence: true
  enum sex: { 男性: 0, 女性: 1}

  def age
    d1 = self.birth_date.strftime("%Y%m%d").to_i
    d2 = Date.today.strftime("%Y%m%d").to_i
    return (d2 - d1) / 10000
  end
end
