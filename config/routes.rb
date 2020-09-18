Rails.application.routes.draw do

  get 'teachers/show'
  root 'home#index'


  # 認証に必要なルーティングを自動で設定
  devise_for :teachers
  devise_for :users

  resources :users, only: [:show]
  resources :teachers, only: [:show]

end
