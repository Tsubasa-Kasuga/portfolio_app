class Admin::UsersController < Admin::ApplicationController
  layout "admin_layout"

  def index
    @users = User.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    @user = User.find(params[:id])
    @lessons_attendanced = Teacher.joins(lessons: :attendance).select("lessons.*").where(attendances: { user_id: params[:id] }).paginate(page: params[:page], per_page: 3)
    @lessons_attendanced = Lesson.joins(:teacher, :attendance).select("lessons.*").where(attendances: { user_id: params[:id] }).paginate(page: params[:page], per_page: 3)
    @lessons_finished = Lesson.where(teacher_id: params[:id], deleted: true).paginate(page: params[:page], per_page: 3)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_user_path
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :birth_date, :sex, :avatar)
  end
end
