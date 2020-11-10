class AdminController < ApplicationController
  layout "admin_layout"

  def index
    if !admin_signed_in?
      redirect_to new_admin_session_path
    end
  end

  def new_guest
    admin = Admin.find_or_create_by!(email: "guest_admin@example.com") do |admin|
      admin.password = SecureRandom.urlsafe_base64
    end
    sign_in admin
    redirect_to admin_root_path, notice: "ゲスト管理者としてログインしました。"
  end
end
