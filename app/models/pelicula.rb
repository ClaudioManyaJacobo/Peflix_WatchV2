class Pelicula < ApplicationRecord
    has_one_attached :foto
    has_one_attached :video
end
