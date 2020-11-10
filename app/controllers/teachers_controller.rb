class TeachersController < ApplicationController
  # マイページ
  def show
    # 会員情報取得
    @teacher = Teacher.find(params[:id])
    # 申請中のレッスンを取得
    @lessons_unapproved = Lesson.where(teacher_id: params[:id], approval: 0, deleted: 0).paginate(page: params[:page], per_page: 3)
    # 承諾済みかつ継続中のレッスンを取得
    @lessons_approved = Lesson.where(teacher_id: params[:id], approval: 1, deleted: 0).paginate(page: params[:page], per_page: 3)
    # 終了しているレッスンを取得
    @lessons_finished = Lesson.where(teacher_id: params[:id], deleted: 1).paginate(page: params[:page], per_page: 3)
  end
  
  def new_guest_teacher
    teacher = Teacher.find_or_create_by!(email: "guest_teacher@example.com") do |teacher|
      teacher.name = "ゲスト講師"
      teacher.birth_date = "1985-9-1"
      teacher.sex = 1
      teacher.password = SecureRandom.urlsafe_base64
    end
    sign_in teacher
    redirect_to teacher_path(teacher), notice: "ゲストユーザー（講師）としてログインしました。"
  end
end
