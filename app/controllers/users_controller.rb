class UsersController < ApplicationController
  # マイページ
  def show
    # 会員情報取得
    @user = User.find(params[:id])
    # 申請中のレッスンを取得
    @lessons_attendanced = @user.lessons
    # 終了しているレッスンを取得
    @lessons_finished = Lesson.where(teacher_id: params[:id], deleted: true)
  end
end
