class UsersController < ApplicationController
  # マイページ
  def show
    # 会員情報取得
    @user = User.find(params[:id])
    # 申請中のレッスンを取得
    # SELECT `lessons`.* FROM `lessons` INNER JOIN `attendances` ON `attendances`.`lesson_id` = `lessons`.`id` LIMIT 11
    @lessons_attendanced = Teacher.joins(lessons: :attendance).select("lessons.*").where(attendances: { user_id: params[:id] }).paginate(page: params[:page], per_page: 3)
    # @lessons_attendanced = Lesson.joins(:teacher).select('lessons.*').find(params[:id])
    @lessons_attendanced = Lesson.joins(:teacher, :attendance).select("lessons.*").where(attendances: { user_id: params[:id] }).paginate(page: params[:page], per_page: 3)
    # 終了しているレッスンを取得
    @lessons_finished = Lesson.where(teacher_id: params[:id], deleted: true).paginate(page: params[:page], per_page: 3)
  end
end
