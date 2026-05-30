using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Resenia
    {
        public int IdResenia { get; set; }
        public Usuario Usuario { get; set; }
        public Pelicula Pelicula { get; set; }
        public string Comentario { get; set; }
        public int Calificacion { get; set; }
        public DateTime Fecha { get; set; }
    }
}
