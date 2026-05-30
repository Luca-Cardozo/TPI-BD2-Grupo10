using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Usuario
    {
        public int IdUsuario { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string DNI { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Telefono { get; set; }
        public bool EsAdmin { get; set; }
        // Suscripción vigente
        public Suscripcion SuscripcionActual { get; set; }
        // Historial de suscripciones
        public List<Suscripcion> HistorialSuscripciones { get; set; }
        public List<Resenia> Resenias { get; set; }
        public List<Visualizacion> Visualizaciones { get; set; }
        public List<Watchlist> Watchlist { get; set; }
    }
}
