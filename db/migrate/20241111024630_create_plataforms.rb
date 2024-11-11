class CreatePlataforms < ActiveRecord::Migration[7.0]
  def change
    create_table :plataforms do |t|
      t.string :name_p
      t.string :url_p
      t.string :tipo_p

      t.timestamps
    end
  end
end
