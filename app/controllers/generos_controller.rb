class GenerosController < ApplicationController
    before_action :set_genero, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!  # Verifica que el usuario esté autenticado
    before_action :authorize_admin     # Restringe el acceso a administradores

    # GET /generos
    def index
      @generos = Genero.all
    end
  
    # GET /generos/1
    def show
    end
  
    # GET /generos/new
    def new
      @genero = Genero.new
    end
  
    # POST /generos
    def create
      @genero = Genero.new(genero_params)
  
      if @genero.save
        redirect_to @genero, notice: 'Género creado con éxito.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    # GET /generos/1/edit
    def edit
    end
  
    # PATCH/PUT /generos/1
    def update
      if @genero.update(genero_params)
        redirect_to @genero, notice: 'Género actualizado con éxito.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    # DELETE /generos/1
    def destroy
      @genero.destroy
      redirect_to generos_url, notice: 'Género eliminado con éxito.'
    end
  
    private
  
    # Callback para cargar el género
    def set_genero
      @genero = Genero.find(params[:id])
    end
  
    # Definir los parámetros permitidos
    def genero_params
      params.require(:genero).permit(:nombre)
    end


    def authorize_admin
      unless admin_user?
        redirect_to peliculas_path, alert: "No tienes permiso para realizar esta acción."
      end
    end

  end
  