class AttendancesController < ApplicationController
  def create
    @lesson = Lesson.find(params[:lesson_id])
    Attendance.create(user_id: current_user.id, lesson_id: params[:lesson_id])
    redirect_to @lesson, notice: "申し込みが完了しました。講師からのメールをお待ちください。"
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.deleted = true
    if @attendance.save
      redirect_to lesson_path(@attendance.lesson_id)
    else
      render "edit"
    end
  end
end
