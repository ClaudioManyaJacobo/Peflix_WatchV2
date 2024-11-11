class PlataformsController < ApplicationController
  def index
    @plataforms = Plataform.all
  end

  def show 
    plataform
  end

  def new 
    @plataform = Plataform.new
  end

  def create
    @plataform = Plataform.new(plataform_params)
    if @plataform.save
      redirect_to plataforms_path, notice: "La plataforma ha sido creada con éxito"
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
    plataform
  end

  def update
    if plataform.update(plataform_params)
      redirect_to plataforms_path, notice: "La plataforma ha sido actualizada con éxito"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    plataform.destroy

    redirect_to plataforms_path, notice: "La plataforma ha sido eliminada con éxito", status: :see_other
  end

  private
  def plataform_params
    params.require(:plataform).permit(:name_p, :url_p, :tipo_p, :photo_plataform)
  end

  def plataform
    @plataform = Plataform.find(params[:id])
  end

end