class UsersController < ApplicationController
  # マイページ
  def show
    # 会員情報取得
    @user = User.find(params[:id])
  end
end
