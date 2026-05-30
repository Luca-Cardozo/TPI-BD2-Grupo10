using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Pelicula
    {
        public int IdPelicula { get; set; }
        public string Titulo { get; set; }
        public string Descripcion { get; set; }
        public int DuracionMinutos { get; set; }
        public DateTime FechaEstreno { get; set; }
        public string URLImagen { get; set; }
        public string URLTrailer { get; set; }
        public int ContadorVisualizaciones { get; set; }
        public decimal PromedioCalificacion { get; set; }
        public bool Activo { get; set; }
        public Director Director { get; set; }
        public Clasificacion Clasificacion { get; set; }
        public List<Genero> Generos { get; set; }
        public List<Actor> Actores { get; set; }
        public List<Resenia> Resenias { get; set; }
        public List<Visualizacion> Visualizaciones { get; set; }
    }
}
