Rails.application.routes.draw do
  resources :peliculas, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  # otras rutas
end
