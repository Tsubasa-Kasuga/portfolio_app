Rails.application.routes.draw do

  get 'attendances/new'
  get 'teachers/show'
  root 'home#index'
  resources :lessons
  resources :attendances, only: [:create, :destroy]

  # 認証に必要なルーティングを自動で設定
  devise_for :teachers
  devise_for :users


  resources :users, only: [:show]
  resources :teachers, only: [:show]

end
