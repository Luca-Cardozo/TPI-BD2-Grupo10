using Acceso_Datos;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class UsuarioNegocio
    {
        public Usuario login(string email, string password)
        {
            Usuario usuario = null;
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT U.IdUsuario, U.Nombre, U.Apellido, U.DNI, U.Email, " +
                "U.Password, U.Telefono, U.EsAdmin, S.IdSuscripcion, S.Descripcion, S.PrecioMensual " +
                "FROM Usuarios U " +
                "INNER JOIN UsuariosxSuscripciones US ON US.IdUsuario = U.IdUsuario " +
                "INNER JOIN Suscripciones S ON S.IdSuscripcion = US.IdSuscripcion " +
                "WHERE U.Email = @Email AND U.Password = @Password AND US.Activo = 1"
                );

                datos.setearParametro("@Email", email);

                datos.setearParametro("@Password", password);

                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    usuario = new Usuario();

                    usuario.IdUsuario = (int)datos.Lector["IdUsuario"];

                    usuario.Nombre = datos.Lector["Nombre"].ToString();

                    usuario.Apellido = datos.Lector["Apellido"].ToString();

                    usuario.DNI = datos.Lector["DNI"].ToString();

                    usuario.Email = datos.Lector["Email"].ToString();

                    usuario.Password = datos.Lector["Password"].ToString();

                    usuario.Telefono = datos.Lector["Telefono"].ToString();

                    usuario.EsAdmin = (bool)datos.Lector["EsAdmin"];

                    usuario.SuscripcionActual = new Suscripcion();

                    usuario.SuscripcionActual.IdSuscripcion = (int)datos.Lector["IdSuscripcion"];

                    usuario.SuscripcionActual.Descripcion = datos.Lector["Descripcion"].ToString();

                    usuario.SuscripcionActual.PrecioMensual = (decimal)datos.Lector["PrecioMensual"];
                }

                return usuario;
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


        public void cambiarSuscripcion(int idUsuario, int idSuscripcionNueva)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_CambioSuscripcion");
                datos.setearParametro("@IdUsuario", idUsuario);
                datos.setearParametro("@IdSuscripcionNueva", idSuscripcionNueva);
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

        public void registrarUsuario(Usuario nuevo, int idSuscripcion)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {

                datos.setearProcedimiento("SP_RegistrarUsuario");


                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Apellido", nuevo.Apellido);
                datos.setearParametro("@DNI", nuevo.DNI);
                datos.setearParametro("@Email", nuevo.Email);
                datos.setearParametro("@Password", nuevo.Password);
                if (string.IsNullOrEmpty(nuevo.Telefono))
                {

                    datos.setearParametro("@Telefono", DBNull.Value);
                }
                else
                {

                    datos.setearParametro("@Telefono", nuevo.Telefono);
                }
                datos.setearParametro("@IdSuscripcion", idSuscripcion);


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
