using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acceso_Datos;
using Dominio;

namespace Negocio
{
    public class GeneroNegocio
    {
        public List<Genero> listar()
        {
            List<Genero> lista = new List<Genero>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT IdGenero, Descripcion FROM Generos");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Genero aux = new Genero();
                    aux.IdGenero = (int)datos.Lector["IdGenero"];
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
