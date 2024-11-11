Rails.application.routes.draw do
  resources :peliculas, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :generos
  resources :actors
  resources :plataforms
end
