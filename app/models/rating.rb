class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :pelicula

  validates :score, presence: true, inclusion: { in: 1..5 }
  validates :user_id, uniqueness: { scope: :pelicula_id, message: "ya ha valorado esta película" }
end

