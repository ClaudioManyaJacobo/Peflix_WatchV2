class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save :ensure_reset_password_token

  private
         
  def ensure_reset_password_token
    self.reset_password_token ||= SecureRandom.hex(10)
  end
end
