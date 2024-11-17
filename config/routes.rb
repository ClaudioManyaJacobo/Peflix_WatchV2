Rails.application.routes.draw do
  devise_for :users
  resources :peliculas, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :generos
  resources :actors
  resources :plataforms

  root 'peliculas#index'

  resources :peliculas do
    resources :ratings, only: [:create, :update]
    resources :comments, only: [:create, :destroy]
  end
end