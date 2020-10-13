class Admin::TeachersController < Admin::ApplicationController
  layout 'admin_layout'
  def index
    @teachers = Teacher.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    # 会員情報取得
    @teacher = Teacher.find(params[:id])
    # 申請中のレッスンを取得
    @lessons_unapproved = Lesson.where(teacher_id: params[:id], approval: false).paginate(page: params[:page], per_page: 3)
    # 承諾済みかつ継続中のレッスンを取得
    @lessons_approved = Lesson.where(teacher_id: params[:id], approval: true).paginate(page: params[:page], per_page: 3)
    # 終了しているレッスンを取得
    @lessons_finished = Lesson.where(teacher_id: params[:id], deleted: true).paginate(page: params[:page], per_page: 3)
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
  
    if @teacher.update(teacher_params)
      redirect_to admin_teacher_path
    else
      render 'edit'
    end
  end

  private
  def teacher_params
      params.require(:teacher).permit(:name, :email, :birth_date, :sex, :avatar)
  end

end