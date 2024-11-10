class Pelicula < ApplicationRecord
    has_and_belongs_to_many :generos
    has_one_attached :foto
    has_one_attached :video
end
