Rails.application.routes.draw do
  root to: 'admins#index'
  resources :admins
  resources :customers
  resources :menus
end
