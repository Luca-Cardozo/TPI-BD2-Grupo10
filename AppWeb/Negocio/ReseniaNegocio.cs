using Acceso_Datos;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class ReseniaNegocio
    {
        public List<Resenia> listarPorPelicula(int idPelicula)
        {
            List<Resenia> lista = new List<Resenia>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(
                    "SELECT R.IdResenia, R.Comentario, R.Calificacion, R.Fecha, " +
                    "U.IdUsuario, U.Nombre, U.Apellido FROM Resenias R " +
                    "INNER JOIN Usuarios U ON U.IdUsuario = R.IdUsuario " +
                    "WHERE R.IdPelicula = @IdPelicula " +
                    "ORDER BY R.Fecha DESC"
                );

                datos.setearParametro("@IdPelicula", idPelicula);

                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Resenia aux = new Resenia();

                    aux.IdResenia = (int)datos.Lector["IdResenia"];
                    aux.Comentario = datos.Lector["Comentario"].ToString();
                    aux.Calificacion = (int)datos.Lector["Calificacion"];
                    aux.Fecha = (DateTime)datos.Lector["Fecha"];

                    aux.Usuario = new Usuario();
                    aux.Usuario.IdUsuario = (int)datos.Lector["IdUsuario"];
                    aux.Usuario.Nombre = datos.Lector["Nombre"].ToString();
                    aux.Usuario.Apellido = datos.Lector["Apellido"].ToString();

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
