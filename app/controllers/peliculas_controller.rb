class PeliculasController < ApplicationController
    # Acción para mostrar todas las películas
    def index
      @peliculas = Pelicula.all
    end
  
    # Acción para mostrar el formulario de nueva película
    def new
      @pelicula = Pelicula.new
    end
  
    # Acción para crear una nueva película
    def create
      @pelicula = Pelicula.new(pelicula_params)
  
      if @pelicula.save
        redirect_to @pelicula, notice: 'Película creada con éxito.'
      else
        render :new
      end
    end
  
    # Acción para mostrar una película
    def show
      @pelicula = Pelicula.find(params[:id])
    end
  
    private
  
    # Definir los parámetros permitidos para crear una película
    def pelicula_params
      params.require(:pelicula).permit(:titulo, :anio, :sinopsis, :duracion, :director, :foto, :video)
    end
  end
  