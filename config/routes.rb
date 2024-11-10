Rails.application.routes.draw do
  resources :peliculas, only: [:index, :show, :new, :create, :edit, :update]
  # otras rutas
end
