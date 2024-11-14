class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :pelicula

  validates :content, presence: true, length: { minimum: 5, maximum: 500 }
end
