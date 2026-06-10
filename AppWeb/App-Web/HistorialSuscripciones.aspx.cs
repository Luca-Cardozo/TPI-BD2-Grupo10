
using Dominio;
using Acceso_Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace App_Web
{
    public partial class HistorialSuscripciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Usuario"] == null)
            {
                Response.Redirect("Login.aspx", false);
                return;
            }


            var user = (Usuario)Session["Usuario"];


            if (user.EsAdmin == false)
            {

                Response.Redirect("Home.aspx", false);
                return;
            }


            if (!IsPostBack)
            {
                cargarHistorial();
            }
        }

        private void cargarHistorial()
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {

                datos.setearConsulta("SELECT IdUsuario, Nombre, Apellido, Email, TipoMembresia, FechaAlta, FechaBaja, EsSuscripcionActiva, EstadoVigencia FROM VW_HistorialSuscripciones");
                datos.ejecutarLectura();


                dgvHistorial.DataSource = datos.Lector;
                dgvHistorial.DataBind();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "⚠️ No se pudo cargar el historial: " + ex.Message;
                lblMensaje.CssClass = "alert alert-danger d-block";
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}