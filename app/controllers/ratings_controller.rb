class RatingsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_pelicula
  
    def create
      @rating = @pelicula.ratings.find_or_initialize_by(user: current_user)
      @rating.score = params[:rating][:score]
  
      if @rating.save
        redirect_to @pelicula, notice: "Tu valoración ha sido registrada."
      else
        redirect_to @pelicula, alert: "No se pudo registrar tu valoración: #{@rating.errors.full_messages.join(', ')}"
      end
    end
  
    def update
      @rating = @pelicula.ratings.find(params[:id])
      @rating.score = params[:rating][:score]
  
      if @rating.save
        redirect_to @pelicula, notice: "Tu valoración ha sido actualizada."
      else
        redirect_to @pelicula, alert: "No se pudo actualizar tu valoración: #{@rating.errors.full_messages.join(', ')}"
      end
    end
  
    private
  
    def set_pelicula
      @pelicula = Pelicula.find(params[:pelicula_id])
    end
  end
  