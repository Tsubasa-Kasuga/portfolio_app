class Admin::LessonsController < Admin::ApplicationController
  layout 'admin_layout'

  def index
    @lessons_unapproved = Lesson.all.where(approval: 0).paginate(page: params[:page], per_page: 10)
    @lessons_approved = Lesson.all.where(approval: 1).paginate(page: params[:page], per_page: 10)
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
    redirect_to admin_lesson_path
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
  
    if @lesson.update(lesson_params)
      redirect_to admin_lesson_path
    else
      render 'edit'
    end
  end

  def approval
    @lesson = Lesson.find(params[:id])
    @lesson.approval = 1
    @lesson.save
    redirect_to admin_lessons_path
  end

  private
    def lesson_params
        params.require(:lesson).permit(:title, :description, :time, :price, :frequency, :lessonImage)
    end
end