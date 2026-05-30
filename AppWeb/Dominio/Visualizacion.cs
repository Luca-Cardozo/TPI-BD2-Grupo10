using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Visualizacion
    {
        public int IdVisualizacion { get; set; }
        public Usuario Usuario { get; set; }
        public Pelicula Pelicula { get; set; }
        public DateTime FechaVisualizacion { get; set; }
    }
}
