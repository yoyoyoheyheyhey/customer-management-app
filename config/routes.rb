Rails.application.routes.draw do
  devise_for :admins
  root to: 'customers#index'
  resources :super_admins, only: [:show, :new, :create, :edit, :update, :destroy] do
    member do
      get 'undiscard_admin'
      get 'undiscard_menu'
      get 'undiscard_customer'
      delete 'discard'
    end
    collection do
      get 'discarded'
    end
  end
  resources :admins, only: [:index, :show, :edit, :update]
  resources :customers do
    member do
      delete 'discard'
    end
  end
  resources :customer_visit_histories, only: [:new, :create, :edit, :update, :destroy]
  resources :menus
end
