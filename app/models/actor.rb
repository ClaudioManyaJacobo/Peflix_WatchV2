class Actor < ApplicationRecord
    validates :name, presence: true
    validates :url_actor, presence: true

    has_one_attached :photo_actor
    
end
