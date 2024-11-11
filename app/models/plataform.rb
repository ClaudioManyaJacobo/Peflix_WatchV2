class Plataform < ApplicationRecord

    validates :name_p, presence: true
    validates :url_p, presence: true
    validates :tipo_p, presence: true

    has_one_attached :photo_plataform
    

end
