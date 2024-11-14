class PeliculasController < ApplicationController
    before_action :set_pelicula, only: [:show, :edit, :update, :destroy]
  
    before_action :authenticate_user!, only: [:index, :show] 
    before_action :authorize_admin, except: [:index, :show] 
  
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
      render :new, status: :unprocessable_entity
      end
    end
  
    # Acción para mostrar una película
    def show
      @pelicula = Pelicula.find(params[:id])
    end
  
    # Acción para mostrar el formulario de edición
    def edit
      # @pelicula ya está disponible debido al before_action
    end
  
    # Acción para actualizar una película
    def update
      if @pelicula.update(pelicula_params)
        redirect_to @pelicula, notice: 'Película actualizada exitosamente.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
  # Acción para eliminar una película
  def destroy
    @pelicula.destroy
    redirect_to peliculas_path, notice: 'Película eliminada con éxito.'
  end

  private

  # Definir los parámetros permitidos para crear o actualizar una película
  def pelicula_params
    params.require(:pelicula).permit(:titulo, :anio, :sinopsis, :duracion, :director, :foto, :video, genero_ids: [], actor_ids: [], plataform_ids: [])
  end
  

  # Cargar la película por ID
  def set_pelicula
    @pelicula = Pelicula.find(params[:id])
  end

  def authorize_admin
    unless admin_user?
      redirect_to peliculas_path, alert: "No tienes permiso para realizar esta acción."
    end
  end

end
  