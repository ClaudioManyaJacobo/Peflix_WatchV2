class CreateJoinTableGenerosPeliculas < ActiveRecord::Migration[7.0]
  def change
    create_join_table :generos, :peliculas do |t|
      t.index [:genero_id, :pelicula_id]
      t.index [:pelicula_id, :genero_id]
    end
  end
end
