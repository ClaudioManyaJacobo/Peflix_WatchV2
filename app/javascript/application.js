// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("visibilitychange", function () {
    const favicon = document.getElementById("dynamic-favicon");
    const originalTitle = "Peliculizate Watch";  // El título original que deseas mostrar
  
    if (document.hidden) {
      // Cambia el favicon y el título cuando el usuario sale de la pestaña
      favicon.href = "/assets/triste.png";
      document.title = "No te vayas 😢";  // Cambiar el título inmediatamente
    } else {
      // Restaura el favicon y el título original cuando el usuario regresa a la pestaña
      favicon.href = "/assets/favicon.png";
      document.title = originalTitle;  // Restaurar el título original a "Peliculizate Watch"
    }
  });
  
  
  
  
  
  
  