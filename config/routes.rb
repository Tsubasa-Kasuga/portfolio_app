Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get  '/signup',  to: 'users#new'
end
