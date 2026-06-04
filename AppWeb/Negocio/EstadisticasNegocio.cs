using Acceso_Datos;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class EstadisticasNegocio
    {
        public List<ResumenActividadUsuario> listarResumenActividad()
        {
            AccesoDatos datos = new AccesoDatos();
            List<ResumenActividadUsuario> lista = new List<ResumenActividadUsuario>();
            try
            {
                datos.setearConsulta("SELECT Nombre, Apellido, DNI, Email, Suscripcion, " +
                    "CantReseñas, CantReproducciones FROM VW_ResumenActividadUsuarios " +
                    "WHERE Nombre NOT LIKE 'Admin'");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    ResumenActividadUsuario aux = new ResumenActividadUsuario();
                    aux.Nombre = datos.Lector["Nombre"].ToString();
                    aux.Apellido = datos.Lector["Apellido"].ToString();
                    aux.DNI = datos.Lector["DNI"].ToString();
                    aux.Email = datos.Lector["Email"].ToString();
                    aux.Suscripcion = datos.Lector["Suscripcion"].ToString();
                    aux.CantResenias = (int)datos.Lector["CantReseñas"];
                    aux.CantReproducciones = (int)datos.Lector["CantReproducciones"];
                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
