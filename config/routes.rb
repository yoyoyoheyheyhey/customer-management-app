Rails.application.routes.draw do
  root to: 'admins#index'
  resources :admins
  resources :customers
  resources :customer_visit_histories
  resources :menus
end
