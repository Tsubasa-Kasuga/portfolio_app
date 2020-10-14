class LessonsController < ApplicationController

  def index
    @lessons = Lesson.all.where(approval: true, deleted: false).paginate(page: params[:page], per_page: 6)
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

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
  
    if @lesson.update(lesson_params)
      redirect_to @lesson
    else
      render 'edit'
    end
  end
  
  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.deleted = true
    if @lesson.save
      redirect_to teacher_path(current_teacher)
    else
      render 'edit'
    end
  end

  def cancel
      @lesson = Lesson.find(params[:id])
      @lesson.deleted = true
      if @lesson.save
        redirect_to teacher_path(current_teacher)
      else
        render 'edit'
      end
  end

  private
    def lesson_params
        params.require(:lesson).permit(:title, :description, :time, :price, :frequency, :lessonImage)
    end
end
