Rails.application.routes.draw do
  resources :peliculas, only: [:index, :show, :new, :create]
  # otras rutas
end

