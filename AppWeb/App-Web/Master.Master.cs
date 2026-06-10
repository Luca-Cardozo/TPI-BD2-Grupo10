using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace App_Web
{
    public partial class Master : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            bool logueado = Session["Usuario"] != null;

            liLogin.Visible = !logueado;
            liLogout.Visible = logueado;
            liRegistro.Visible = !logueado;
            liCatalogo.Visible = logueado;
            liSuscripcion.Visible = logueado;
            liResumenActividadUsuarios.Visible = false;
            liWatchlist.Visible = false;
            liHistorialSuscripciones.Visible = false;

            if (logueado)
            {
                Usuario usuario = (Usuario)Session["Usuario"];

                if (usuario.EsAdmin)
                    lblUsuarioLogueado.Text = "🛠️ " + usuario.Nombre;
                else
                    lblUsuarioLogueado.Text = "👤 " + usuario.Nombre;

                liWatchlist.Visible = usuario.SuscripcionActual.IdSuscripcion == 3;
                liResumenActividadUsuarios.Visible = usuario.EsAdmin == true;
                liHistorialSuscripciones.Visible = usuario.EsAdmin == true;
            }

        }
    }
}