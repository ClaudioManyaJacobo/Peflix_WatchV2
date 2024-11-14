class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_pelicula
  
    def create
      @comment = @pelicula.comments.build(comment_params)
      @comment.user = current_user
  
      if @comment.save
        redirect_to @pelicula, notice: "Comentario agregado con éxito."
      else
        redirect_to @pelicula, alert: "No se pudo agregar el comentario: #{@comment.errors.full_messages.join(', ')}"
      end
    end
  
    def destroy
      @comment = @pelicula.comments.find(params[:id])
      if @comment.user == current_user
        @comment.destroy
        redirect_to @pelicula, notice: "Comentario eliminado con éxito."
      else
        redirect_to @pelicula, alert: "No tienes permiso para eliminar este comentario."
      end
    end
  
    private
  
    def set_pelicula
      @pelicula = Pelicula.find(params[:pelicula_id])
    end
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
  