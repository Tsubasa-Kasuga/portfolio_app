class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @lessons_attendanced = Lesson.joins(:teacher, :attendance).select("lessons.*, attendances.created_at AS joinDate").where(attendances: { user_id: params[:id], deleted: false }).paginate(page: params[:page], per_page: 3)
    @lessons_finished = Lesson.joins(:teacher, :attendance).select("lessons.*, attendances.created_at AS joinDate").where(attendances: { user_id: params[:id], deleted: true }).paginate(page: params[:page], per_page: 3)
  end

  def new_guest
    user = User.find_or_create_by!(email: "guest@example.com") do |user|
      user.name = "ゲスト会員"
      user.birth_date = "1990-10-1"
      user.sex = 1
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to user_path(user), notice: "ゲストユーザーとしてログインしました。"
  end
  
end
