Rails.application.routes.draw do
  devise_for :admins
  root to: 'admins#index'
  resources :admins do
    member do
      delete :destroy_icon
    end
  end
  resources :customers
  resources :customer_visit_histories, only: [:new, :create, :edit, :update, :destroy]
  resources :menus
end
