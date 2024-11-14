class ApplicationController < ActionController::Base
    before_action :authenticate_user! # Requiere autenticación para todas las acciones
  
    def admin_user?
      current_user && current_user.admin?
    end
  
    helper_method :admin_user? # Hacer que admin_user? esté disponible en las vistas
end