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
    public partial class Watchlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            Usuario usuario = (Usuario)Session["Usuario"];

            if (usuario.SuscripcionActual.IdSuscripcion != 3)
            {
                Response.Redirect("Home.aspx");
            }

            if (!IsPostBack)
            {
                cargarWatchlist();
            }
        }

        private void cargarWatchlist()
        {
            Usuario usuario = (Usuario)Session["Usuario"];

            PeliculaNegocio negocio = new PeliculaNegocio();

            repWatchlist.DataSource = negocio.listarWatchlistPorUsuario(usuario.IdUsuario);

            repWatchlist.DataBind();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender;
                int idPelicula = int.Parse(btn.CommandArgument);

                Usuario usuario = (Usuario)Session["Usuario"];
                PeliculaNegocio negocio = new PeliculaNegocio();

                negocio.eliminarPeliculaDeWatchlistDeUsuario(usuario.IdUsuario, idPelicula);
                cargarWatchlist();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}