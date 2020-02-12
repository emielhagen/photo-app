Rails.application.routes.draw do
  devise_for :users
    root to: 'albums#index'

  resources :albums do
    resources :photos
  end

  resources :photos do
    resources :favorite_photos, only: :create
  end

  resources :favorite_photos, only: %i[index destroy]
end
