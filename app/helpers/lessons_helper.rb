module LessonsHelper
  def attendanceCheck(lessonId)
    Attendance.exists?(user_id: current_user.id, lesson_id: lessonId,  termination: 0, deleted: 0)
  end
end
