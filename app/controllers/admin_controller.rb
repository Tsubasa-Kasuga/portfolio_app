class AdminController < ApplicationController
  layout "admin_layout"

  def index
    if !admin_signed_in?
      redirect_to new_admin_session_path
    end
  end
end
