Rails.application.routes.draw do
  devise_for :admins
  root to: 'customers#index'
  resources :super_admins, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :admins, only: [:index, :show, :edit, :update]
  resources :customers
  resources :customer_visit_histories, only: [:new, :create, :edit, :update, :destroy]
  resources :menus
end
