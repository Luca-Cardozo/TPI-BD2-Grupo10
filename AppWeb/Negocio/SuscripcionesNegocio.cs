using Acceso_Datos;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class SuscripcionesNegocio
    {
        public List<Suscripcion> listar()
        {
            List<Suscripcion> lista = new List<Suscripcion>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT IdSuscripcion, Descripcion, PrecioMensual FROM Suscripciones");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Suscripcion aux = new Suscripcion();
                    aux.IdSuscripcion = (int)datos.Lector["IdSuscripcion"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    aux.PrecioMensual = (decimal)datos.Lector["PrecioMensual"];
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
