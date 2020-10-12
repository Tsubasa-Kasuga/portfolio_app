Rails.application.routes.draw do

  
  get 'attendances/new'
  get 'teachers/show'
  root 'home#index'
  resources :lessons
  resources :attendances, only: [:create, :destroy]

  # 認証に必要なルーティングを自動で設定
  devise_for :admins
  devise_for :teachers
  devise_for :users
  

  resources :users, only: [:show]
  resources :teachers, only: [:show]
  resources :admins, only: [:index], path: '/admins'
  resources :users, path: '/admins/users'

end
