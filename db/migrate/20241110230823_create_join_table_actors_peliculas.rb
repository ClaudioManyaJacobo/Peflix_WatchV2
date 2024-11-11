class CreateJoinTableActorsPeliculas < ActiveRecord::Migration[7.0]
  def change
    create_join_table :actors, :peliculas do |t|
      t.index [:actor_id, :pelicula_id]
      t.index [:pelicula_id, :actor_id]
    end
  end
end
