class Genero < ApplicationRecord
    has_and_belongs_to_many :peliculas
    validates :nombre, presence: true, uniqueness: { case_sensitive: false, message: "ya existe" }
end
