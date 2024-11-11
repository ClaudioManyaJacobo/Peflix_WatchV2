class CreateJoinTablePlataformsPeliculas < ActiveRecord::Migration[7.0]
  def change
    create_join_table :plataforms, :peliculas do |t|
      t.index [:plataform_id, :pelicula_id]
      t.index [:pelicula_id, :plataform_id]
    end
  end
end
