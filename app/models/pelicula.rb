class Pelicula < ApplicationRecord
    validates :titulo, presence: true, uniqueness: { case_sensitive: false, message: "ya está registrado" }
    has_and_belongs_to_many :generos
    has_and_belongs_to_many :actors
    has_and_belongs_to_many :plataforms

    has_one_attached :foto
    has_one_attached :video
end
