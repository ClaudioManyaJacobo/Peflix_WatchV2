class ActorsController < ApplicationController
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
end