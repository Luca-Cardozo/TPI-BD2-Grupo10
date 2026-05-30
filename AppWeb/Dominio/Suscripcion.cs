using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Suscripcion
    {
        public int IdSuscripcion { get; set; }
        public string Descripcion { get; set; }
        public int PrecioMensual { get; set; }
        public DateTime FechaAlta { get; set; }
        // DateTime que admite NULL
        public DateTime? FechaBaja { get; set; }
        public bool Activo { get; set; }
    }
}
