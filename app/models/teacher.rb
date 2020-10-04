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
end
