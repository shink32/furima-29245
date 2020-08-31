Rails.application.routes.draw do
  devise_for :users
  # root "ここに入れる"
  resources :users, only: [:edit, :update]

  
end
