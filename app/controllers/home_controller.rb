class HomeController < ApplicationController
  def index
  end

  def new_guest
    user = User.find_or_create_by!(email: "guest@example.com") do |user|
      user.name = "ゲスト会員"
      user.birth_date = "1990-10-1"
      user.sex = 1
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました。"
  end

  def new_guest_teacher
    teacher = Teacher.find_or_create_by!(email: "guest_teacher@example.com") do |teacher|
      teacher.name = "ゲスト講師"
      teacher.birth_date = "1985-9-1"
      teacher.sex = 1
      teacher.password = SecureRandom.urlsafe_base64
    end
    sign_in teacher
    redirect_to root_path, notice: "ゲストユーザー（講師）としてログインしました。"
  end
end
