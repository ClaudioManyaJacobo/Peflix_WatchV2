Rails.application.routes.draw do
  resources :peliculas, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :generos

  # get '/actors', to: 'actors#index'
  # get '/actors/:id', to: 'actors#show', as: :actor
  # get '/actors/new', to: 'actors#new', as: :new_actor
  # otras rutas
  resources :actors

end
