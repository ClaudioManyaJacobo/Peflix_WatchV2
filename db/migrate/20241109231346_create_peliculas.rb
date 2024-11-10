class CreatePeliculas < ActiveRecord::Migration[7.0]
  def change
    create_table :peliculas do |t|
      t.string :titulo
      t.integer :anio
      t.text :sinopsis
      t.integer :duracion
      t.string :director

      t.timestamps
    end
  end
end
