Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"

  resources :patients 
  resources :doctors do 
    resources :appointments, only: [:index, :new, :create, :destroy]
  end 
end
