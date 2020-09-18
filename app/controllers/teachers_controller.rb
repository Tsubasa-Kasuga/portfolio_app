class TeachersController < ApplicationController
  # マイページ
  def show
    # 会員情報取得
    @teacher = Teacher.find(params[:id])
  end
end
