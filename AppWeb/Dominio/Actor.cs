using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Actor
    {
        public int IdActor { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Nacionalidad { get; set; }

        public string NombreCompleto
        {
            get { return Nombre + " " + Apellido; }
        }
    }
}
