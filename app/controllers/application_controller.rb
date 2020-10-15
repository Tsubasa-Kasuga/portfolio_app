class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    case resource
    when User
      user_path(resource.id)
    when Teacher
      teacher_path(resource.id)
    when Admin
      admin_index_path
    end
  end

  protected
  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :birth_date, :sex, :avatar])
    # アカウント編集の時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :birth_date, :sex, :avatar])
  end

end
