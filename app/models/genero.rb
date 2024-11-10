class Genero < ApplicationRecord
    has_and_belongs_to_many :peliculas
end
