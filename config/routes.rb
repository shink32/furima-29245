Rails.application.routes.draw do
  root "items#index"
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :items do
    resources :orders do
      resources :destination, only: [:index, :new, :create]
    end
  end

end
