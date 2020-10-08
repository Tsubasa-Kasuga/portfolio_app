class LessonsController < ApplicationController

  def index
    @lessons = Lesson.all.paginate(page: params[:page], per_page: 6)
  end

  def show
    @lesson = Lesson.joins(:teacher).select('lessons.*').find(params[:id])
    
  end

  def new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.teacher_id = current_teacher.id
    @lesson.save
    redirect_to @lesson
  end

  private
    def lesson_params
        params.require(:lesson).permit(:title, :description, :time, :price, :frequency, :lessonImage)
    end
end
