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
        public List<Pelicula> listar()
        {
            List<Pelicula> lista = new List<Pelicula>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(
                    "SELECT P.IdPelicula, P.Titulo, P.Descripcion AS DescripcionPelicula, P.DuracionMinutos, P.FechaEstreno, " +
                    "P.URLImagen, P.URLTrailer, P.ContadorVisualizaciones, P.PromedioCalificacion, P.Activo, " +
                    "D.IdDirector, D.Nombre AS NombreDirector, D.Apellido AS ApellidoDirector, D.Nacionalidad AS NacionalidadDirector, " +
                    "C.IdClasificacion, C.Descripcion AS DescripcionClasificacion, " +
                    "A.IdActor, A.Nombre AS NombreActor, A.Apellido AS ApellidoActor, A.Nacionalidad AS NacionalidadActor, " +
                    "G.IdGenero, G.Descripcion AS DescripcionGenero " +
                    "FROM Peliculas P " +
                    "INNER JOIN Directores D ON D.IdDirector = P.IdDirector " +
                    "INNER JOIN Clasificaciones C ON C.IdClasificacion = P.IdClasificacion " +
                    "LEFT JOIN PeliculasxActores PA ON PA.IdPelicula = P.IdPelicula " +
                    "LEFT JOIN Actores A ON A.IdActor = PA.IdActor " +
                    "LEFT JOIN PeliculasxGeneros PG ON PG.IdPelicula = P.IdPelicula " +
                    "LEFT JOIN Generos G ON G.IdGenero = PG.IdGenero " +
                    "WHERE P.Activo = 1"
                     );
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    int idPelicula = (int)datos.Lector["IdPelicula"];

                    Pelicula pelicula = lista.Find(x => x.IdPelicula == idPelicula);

                    if (pelicula == null)
                    {
                        pelicula = new Pelicula();

                        pelicula.IdPelicula = idPelicula;
                        pelicula.Titulo = datos.Lector["Titulo"].ToString();
                        pelicula.Descripcion = datos.Lector["DescripcionPelicula"].ToString();
                        pelicula.DuracionMinutos = (int)datos.Lector["DuracionMinutos"];
                        pelicula.FechaEstreno = (DateTime)datos.Lector["FechaEstreno"];
                        pelicula.URLImagen = (string)datos.Lector["URLImagen"];
                        pelicula.URLTrailer = (string)datos.Lector["URLTrailer"];
                        pelicula.ContadorVisualizaciones = (int)datos.Lector["ContadorVisualizaciones"];
                        pelicula.PromedioCalificacion = (decimal)datos.Lector["PromedioCalificacion"];
                        pelicula.Activo = (bool)datos.Lector["Activo"];

                        pelicula.Director = new Director
                        {
                            IdDirector = (int)datos.Lector["IdDirector"],
                            Nombre = datos.Lector["NombreDirector"].ToString(),
                            Apellido = datos.Lector["ApellidoDirector"].ToString(),
                            Nacionalidad = datos.Lector["NacionalidadDirector"].ToString()
                        };

                        pelicula.Clasificacion = new Clasificacion
                        {
                            IdClasificacion = (int)datos.Lector["IdClasificacion"],
                            Descripcion = datos.Lector["DescripcionClasificacion"].ToString()
                        };

                        pelicula.Actores = new List<Actor>();
                        pelicula.Generos = new List<Genero>();

                        lista.Add(pelicula);
                    }

                    if (datos.Lector["IdActor"] != DBNull.Value)
                    {
                        int idActor = (int)datos.Lector["IdActor"];

                        bool actorExiste = pelicula.Actores.Exists(a => a.IdActor == idActor);

                        if (!actorExiste)
                        {
                            pelicula.Actores.Add(new Actor
                            {
                                IdActor = idActor,
                                Nombre = datos.Lector["NombreActor"].ToString(),
                                Apellido = datos.Lector["ApellidoActor"].ToString(),
                                Nacionalidad = datos.Lector["NacionalidadActor"].ToString()
                            });
                        }
                    }

                    if (datos.Lector["IdGenero"] != DBNull.Value)
                    {
                        int idGenero = (int)datos.Lector["IdGenero"];

                        bool generoExiste = pelicula.Generos.Exists(g => g.IdGenero == idGenero);

                        if (!generoExiste)
                        {
                            pelicula.Generos.Add(new Genero
                            {
                                IdGenero = idGenero,
                                Descripcion = datos.Lector["DescripcionGenero"].ToString()
                            });
                        }
                    }

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


        public List<Pelicula> listarWatchlistPorUsuario(int idUsuario)
        {
            List<Pelicula> lista = new List<Pelicula>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT P.IdPelicula, P.Titulo, P.URLImagen, " +
                    "P.FechaEstreno, P.DuracionMinutos, P.PromedioCalificacion " +
                    "FROM Peliculas P " +
                    "INNER JOIN Watchlist W ON P.IdPelicula = W.IdPelicula " +
                    "WHERE W.IdUsuario = @IdUsuario AND W.Activo = 1"
                );

                datos.setearParametro("@IdUsuario", idUsuario);

                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Pelicula aux = new Pelicula();

                    aux.IdPelicula = (int)datos.Lector["IdPelicula"];
                    aux.Titulo = datos.Lector["Titulo"].ToString();
                    aux.URLImagen = datos.Lector["URLImagen"].ToString();
                    aux.FechaEstreno = (DateTime)datos.Lector["FechaEstreno"];
                    aux.DuracionMinutos = (int)datos.Lector["DuracionMinutos"];
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

        public void agregarPeliculaDeWatchlistDeUsuario(int idUsuario, int idPelicula)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("INSERT INTO Watchlist (IdUsuario, IdPelicula, Activo) " +
                    "VALUES (@IdUsuario, @IdPelicula, 1)");

                datos.setearParametro("@IdUsuario", idUsuario);

                datos.setearParametro("@IdPelicula", idPelicula);

                datos.ejecutarAccion();
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


        public void eliminarPeliculaDeWatchlistDeUsuario(int idUsuario, int idPelicula)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("DELETE FROM Watchlist WHERE IdUsuario = @IdUsuario AND IdPelicula = @IdPelicula");
                datos.setearParametro("@IdUsuario", idUsuario);
                datos.setearParametro("@IdPelicula", idPelicula);
                datos.ejecutarAccion();
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

        public void registrarVisualizacion(int idUsuario, int idPelicula)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_RegistrarVisualizacion");
                datos.setearParametro("@IdUsuario", idUsuario);
                datos.setearParametro("@IdPelicula", idPelicula);
                datos.ejecutarAccion();
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

        public List<Pelicula> rankingMejoresPuntuadas()
        {
            List<Pelicula> lista = new List<Pelicula>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT IdPelicula, Titulo, PromedioCalificacion, URLImagen FROM VW_RankingMejoresPuntuadas");

                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Pelicula aux = new Pelicula();

                    aux.IdPelicula = (int)datos.Lector["IdPelicula"];
                    aux.Titulo = datos.Lector["Titulo"].ToString();
                    aux.PromedioCalificacion = (decimal)datos.Lector["PromedioCalificacion"];
                    aux.URLImagen = datos.Lector["URLImagen"].ToString();

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

        public void bajaLogicaPelicula(int idPelicula)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("UPDATE Peliculas SET Activo = 0 WHERE IdPelicula = @IdPelicula");
                datos.setearParametro("@IdPelicula", idPelicula);
                datos.ejecutarAccion();
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
