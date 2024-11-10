class AddFotoYVideoToPeliculas < ActiveRecord::Migration[7.0]
  def change
    add_column :peliculas, :foto, :string
    add_column :peliculas, :video, :string
  end
end
