class AttendancesController < ApplicationController
  def create
    @lesson = Lesson.find(params[:lesson_id])
    Attendance.create(user_id: current_user.id, lesson_id: params[:lesson_id])
    redirect_to @lesson
  end
end