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

        public List<HistorialSuscripcion> listarHistorialSuscripciones()
        {
            List<HistorialSuscripcion> lista = new List<HistorialSuscripcion>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT IdUsuario, Nombre, Apellido, Email, TipoMembresia," +
                    "FechaAlta, FechaBaja, EsSuscripcionActiva, EstadoVigencia FROM VW_HistorialSuscripciones");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    HistorialSuscripcion aux = new HistorialSuscripcion();
                    aux.IdUsuario = (int)datos.Lector["IdUsuario"];
                    aux.Nombre = datos.Lector["Nombre"].ToString();
                    aux.Apellido = datos.Lector["Apellido"].ToString();
                    aux.Email = datos.Lector["Email"].ToString();
                    aux.TipoMembresia = datos.Lector["TipoMembresia"].ToString();
                    aux.FechaAlta = (DateTime)datos.Lector["FechaAlta"];


                    if (!(datos.Lector["FechaBaja"] is DBNull))
                        aux.FechaBaja = (DateTime)datos.Lector["FechaBaja"];

                    aux.EsSuscripcionActiva = (bool)datos.Lector["EsSuscripcionActiva"];
                    aux.EstadoVigencia = datos.Lector["EstadoVigencia"].ToString();

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
