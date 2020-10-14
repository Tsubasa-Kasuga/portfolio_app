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
end
