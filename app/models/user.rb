class User < ApplicationRecord
  # Incluye los módulos de Devise. Asegúrate de que Devise está configurado correctamente.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Cambia `after_database_authentication` a `after_save` o `after_create`
  after_save :generate_reset_password_token

  has_many :ratings, dependent: :destroy
  has_many :rated_movies, through: :ratings, source: :movie
  has_many :comments, dependent: :destroy

  private

  def generate_reset_password_token
    raw, hashed = Devise.token_generator.generate(self.class, :reset_password_token)
    self.update_columns(reset_password_token: hashed, reset_password_sent_at: Time.current)
  end
end
