class ActorsController < ApplicationController

    before_action :authenticate_user!        # Verifica que el usuario esté autenticado
    before_action :authorize_admin           # Restringe el acceso a administradores
    before_action :set_actor, only: [:show, :edit, :update, :destroy]


    def index
        @actors = Actor.all
    end
    def show 
        @actor = Actor.find(params[:id]) 
    end
    def new
        @actor = Actor.new
    end

    def create
        @actor = Actor.new(actor_params)

        if @actor.save
            redirect_to actors_path, notice: "Actor añadido :) "
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @actor = Actor.find(params[:id])
    end

    def update
        @actor = Actor.find(params[:id])
        if @actor.update(actor_params)
            redirect_to actors_path, notice: "Actor actualizado"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @actor = Actor.find(params[:id])
        @actor.destroy
        redirect_to actors_path notice: "Actor eliminado", status: :see_other
    end


    private
    def actor_params
        params.require(:actor).permit(:name, :url_actor, :photo_actor)
    end



    def set_actor
        @actor = Actor.find(params[:id])
    end


    def authorize_admin
        unless admin_user?
          redirect_to root_path, alert: "No tienes permiso para eso."
        end
    end
end