using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acceso_Datos;
using Dominio;

namespace Negocio
{
    public class ActorNegocio
    {
        public List<Actor> listar()
        {
            List<Actor> lista = new List<Actor>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT IdActor, Nombre, Apellido, Nacionalidad FROM Actores");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Actor aux = new Actor();
                    aux.IdActor = (int)datos.Lector["IdActor"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Nacionalidad = (string)datos.Lector["Nacionalidad"];
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
