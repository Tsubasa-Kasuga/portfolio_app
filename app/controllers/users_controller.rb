class UsersController < ApplicationController
  # マイページ
  def show
    # 会員情報取得
    @user = User.find(params[:id])
    # 申請中のレッスンを取得
    # SELECT `lessons`.* FROM `lessons` INNER JOIN `attendances` ON `attendances`.`lesson_id` = `lessons`.`id` LIMIT 11
    @lessons_attendanced = Teacher.joins(lessons: :attendance).select('lessons.*, teachers.name').where(attendances: {user_id: 4})
    # 終了しているレッスンを取得
    @lessons_finished = Lesson.where(teacher_id: params[:id], deleted: true)
  end
end
