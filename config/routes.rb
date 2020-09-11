Rails.application.routes.draw do
  root "items#index"
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :items do
    resources :orders,   only:[:index, :new, :create]
    resources :comments, only:[:index, :new, :create]
  end

end
