class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user
  has_many :attendance
  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true
  validates :birth_date, presence: true
  validates :email, presence: true
  validates :sex, presence: true
  enum sex: { 男性: 0, 女性: 1 }

  def age
    if self.birth_date
      d1 = self.birth_date.strftime("%Y%m%d").to_i
      d2 = Date.today.strftime("%Y%m%d").to_i
      "#{(d2 - d1) / 10000}歳"
    else
      "年齢未設定 "
    end
  end
end
