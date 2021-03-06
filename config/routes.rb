Rails.application.routes.draw do

  get 'attendances/new'
  get 'teachers/show'
  get 'lessons/search'
  root 'home#index'
  post 'users/guest_sign_in', to: 'users#new_guest'
  post 'teachers/guest_teacher_sign_in', to: 'teachers#new_guest_teacher'
  post 'admin/guest_sign_in', to: 'admin#new_guest'
  resources :lessons do
    member do
      patch 'cancel'
    end
  end
  resources :attendances, only: [:create, :destroy]

  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords",
  }


  devise_for :teachers, :controllers => {
    :sessions      => "teachers/sessions",
    :registrations => "teachers/registrations",
    :passwords     => "teachers/passwords",
  }

  devise_for :admins, :controllers => {
    :sessions => 'admins/sessions',
    :passwords => 'admins/passwords'
   }
   as :admin do
    get 'admins/edit' => 'admins/registrations#edit', :as => 'edit_admin_registration'
    put 'admins' => 'admins/registrations#update', :as => 'admin_registration'
  end


  resources :users, only: [:show]
  resources :teachers, only: [:show]
  resources :admin, only: [:index]
  namespace :admin do
    root to: "home#index"
    resources :users, :teachers
    resources :lessons do
      member do
        patch 'approval'
      end
    end
  end
end
