using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class ResumenActividadUsuario
    {
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string DNI { get; set; }
        public string Email { get; set; }
        public string Suscripcion { get; set; }
        public int CantResenias { get; set; }
        public int CantReproducciones { get; set; }
    }
}
