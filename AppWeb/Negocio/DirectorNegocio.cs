using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acceso_Datos;
using Dominio;

namespace Negocio
{
    public class DirectorNegocio
    {
        public List<Director> listar()
        {
            List<Director> lista = new List<Director>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT IdDirector, Nombre, Apellido, Nacionalidad FROM Directores");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Director aux = new Director();
                    aux.IdDirector = (int)datos.Lector["IdDirector"];
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
