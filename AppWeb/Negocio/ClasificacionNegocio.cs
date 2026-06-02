using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acceso_Datos;
using Dominio;

namespace Negocio
{
    public class ClasificacionNegocio
    {
        public List<Clasificacion> listar()
        {
            List<Clasificacion> lista = new List<Clasificacion>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT IdClasificacion, Descripcion FROM Clasificaciones");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Clasificacion aux = new Clasificacion();
                    aux.IdClasificacion = (int)datos.Lector["IdClasificacion"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
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
