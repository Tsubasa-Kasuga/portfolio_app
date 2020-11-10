class Admin::TeachersController < Admin::ApplicationController
  layout "admin_layout"

  def index
    @teachers = Teacher.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    @teacher = Teacher.find(params[:id])
    @lessons_unapproved = Lesson.where(teacher_id: params[:id], approval: 0, deleted: 0).paginate(page: params[:page], per_page: 3)
    @lessons_approved = Lesson.where(teacher_id: params[:id], approval: 1, deleted: 0).paginate(page: params[:page], per_page: 3)
    @lessons_finished = Lesson.where(teacher_id: params[:id], deleted: 1).paginate(page: params[:page], per_page: 3)
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])

    if @teacher.update(teacher_params)
      redirect_to admin_teacher_path
    else
      render "edit"
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :email, :birth_date, :sex, :avatar)
  end
end
