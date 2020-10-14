Rails.application.routes.draw do

  
  get 'attendances/new'
  get 'teachers/show'
  root 'home#index'
  resources :lessons do
    member do
      patch 'cancel'
    end
  end
  resources :attendances, only: [:create, :destroy]

  # 認証に必要なルーティングを自動で設定
  devise_for :admins
  devise_for :teachers
  devise_for :users
  

  resources :users, only: [:show]
  resources :teachers, only: [:show]
  resources :admin, only: [:index]
  namespace :admin do
    resources :users, :teachers
    resources :lessons do
      member do
        patch 'approval'
      end
    end
  end
end
