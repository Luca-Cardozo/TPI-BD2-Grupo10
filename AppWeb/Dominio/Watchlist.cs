using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Watchlist
    {
        public int IdWatchlist { get; set; }
        public Usuario Usuario { get; set; }
        public Pelicula Pelicula { get; set; }
        public DateTime FechaAgregado { get; set; }
        public bool Activo { get; set; }
    }
}
