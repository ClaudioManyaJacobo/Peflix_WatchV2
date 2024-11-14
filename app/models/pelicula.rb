class Pelicula < ApplicationRecord
    validates :titulo, presence: true, uniqueness: { case_sensitive: false, message: "ya está registrado" }
    validates :sinopsis, presence: true
    validates :duracion, presence: true
    validates :anio, presence: true
    validates :director, presence: true

    # Relaciones
    has_and_belongs_to_many :generos
    has_and_belongs_to_many :actors
    has_and_belongs_to_many :plataforms

    # Relacion pelicula y usuario y  raiting y comments
    has_many :ratings, dependent: :destroy
    has_many :users, through: :ratings
    has_many :comments, dependent: :destroy

    # Imágenes y videos - EQUI
    has_one_attached :foto
    has_one_attached :video

    def average_rating
        ratings.average(:score).to_f.round(1) if ratings.any?
    end

    def recent_comments
        comments.order(created_at: :desc)
    end
end
