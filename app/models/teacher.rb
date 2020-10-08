class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # バリデーション
  validates :name, presence: true
  validates :birth_date, presence: true
  validates :sex, presence: true
  enum sex: { 男性: 0, 女性: 1}
  
  # 関連付け
  has_many :lessons
  mount_uploader :avatar, AvatarUploader

  def age
    if self.birth_date then
      d1 = self.birth_date.strftime("%Y%m%d").to_i
      d2 = Date.today.strftime("%Y%m%d").to_i
      "#{(d2 - d1) / 10000}歳"
    else
      "年齢未設定"
    end
  end
end
