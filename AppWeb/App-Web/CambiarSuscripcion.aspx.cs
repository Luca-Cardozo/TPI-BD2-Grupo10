using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace App_Web
{
    public partial class CambiarSuscripcion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                cargarSuscripcionActual();
                cargarSuscripciones();
            }
        }

        private void cargarSuscripcionActual()
        {
            Usuario usuario = (Usuario)Session["Usuario"];

            lblSuscripcionActual.Text = usuario.SuscripcionActual.Descripcion;

            lblPrecioActual.Text = "$" + usuario.SuscripcionActual.PrecioMensual.ToString("N2") + " por mes";
        }

        private void cargarSuscripciones()
        {
            SuscripcionesNegocio negocio = new SuscripcionesNegocio();

            List<Suscripcion> lista = negocio.listar();

            ddlSuscripcion.DataSource = lista;

            ddlSuscripcion.DataValueField = "IdSuscripcion";

            ddlSuscripcion.DataTextField = "Descripcion";

            ddlSuscripcion.DataBind();

            ddlSuscripcion.Items.Insert(0, new ListItem("Seleccione una suscripción", "0"));
        }

        protected void ddlSuscripcion_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSuscripcion.SelectedValue != "0")
            {
                SuscripcionesNegocio negocio = new SuscripcionesNegocio();

                Suscripcion suscripcion = negocio.listar().Find(x => x.IdSuscripcion == int.Parse(ddlSuscripcion.SelectedValue));

                lblPrecioNueva.Text = "$" + suscripcion.PrecioMensual.ToString("N2") + " por mes";
            }
        }

        protected void btnCambiar_Click(object sender, EventArgs e)
        {
            try
            {

                Usuario usuario = (Usuario)Session["Usuario"];

                int idNuevaSuscripcion = int.Parse(ddlSuscripcion.SelectedValue);

                UsuarioNegocio negocio = new UsuarioNegocio();

                negocio.cambiarSuscripcion(usuario.IdUsuario, idNuevaSuscripcion);

                SuscripcionesNegocio suscripcionNegocio = new SuscripcionesNegocio();

                usuario.SuscripcionActual = suscripcionNegocio.listar().Find(x => x.IdSuscripcion == idNuevaSuscripcion);

                Session["Usuario"] = usuario;

                lblMensaje.CssClass = "text-success d-block mt-3 text-center fw-bold";
                lblMensaje.Text = "✅ Suscripción actualizada correctamente. Redirigiendo al Home...";
                Response.AddHeader("REFRESH", "3;URL=Home.aspx");
            }
            catch (Exception ex)
            {
                // Mostrar RAISERROR del SP
                lblMensaje.CssClass = "alert alert-danger text-center mt-3";
                lblMensaje.Text = "❌ " + ex.Message;
            }
        }
    }
}