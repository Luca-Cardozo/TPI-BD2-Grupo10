using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using Acceso_Datos;
using Dominio;

namespace Negocio
{
    public class PeliculaNegocio
    {
        public List<Pelicula> SP_BuscarPeliculas(
            string titulo = null, 
            int? idgenero = null, 
            int? idclasificacion = null,
            int? iddirector = null,
            int? idactor = null,
            int? anio = null)
        {
            AccesoDatos datos = new AccesoDatos();
            List<Pelicula> lista = new List<Pelicula>();
            try
            {
                datos.setearProcedimiento("SP_BuscarPeliculas");
                datos.setearParametro("@Titulo", titulo);
                datos.setearParametro("@IdGenero", idgenero);
                datos.setearParametro("@IdClasificacion", idclasificacion);
                datos.setearParametro("@IdDirector", iddirector);
                datos.setearParametro("@IdActor", idactor);
                datos.setearParametro("@AnioEstreno", anio);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Pelicula aux = new Pelicula();
                    aux.IdPelicula = (int)datos.Lector["IdPelicula"];
                    aux.Titulo = (string)datos.Lector["Titulo"];
                    aux.DuracionMinutos = (int)datos.Lector["DuracionMinutos"];
                    aux.FechaEstreno = (DateTime)datos.Lector["FechaEstreno"];
                    aux.PromedioCalificacion = (decimal)datos.Lector["PromedioCalificacion"];
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
