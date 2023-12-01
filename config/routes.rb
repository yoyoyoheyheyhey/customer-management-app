Rails.application.routes.draw do
  devise_for :admins
  root to: 'admins#index'
  resources :admins, only: [:index, :show]
  resources :customers
  resources :customer_visit_histories
  resources :menus
end
