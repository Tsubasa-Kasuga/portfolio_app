Rails.application.routes.draw do
  devise_for :teachers
  devise_for :users
  root 'home#index'
  get  '/signup',  to: 'users#new'
end
