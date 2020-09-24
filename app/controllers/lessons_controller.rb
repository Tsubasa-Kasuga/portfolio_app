class LessonsController < ApplicationController

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    
    @lesson.save
    redirect_to @lesson
  end

  private
    def lesson_params
        params.require(:lesson).permit(:title, :description)
    end
end
