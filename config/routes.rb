Rails.application.routes.draw do
  root "items#index"
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :items
  get 'items', to: 'items#input'

end
