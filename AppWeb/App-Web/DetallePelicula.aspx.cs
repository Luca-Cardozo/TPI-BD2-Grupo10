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
    public partial class DetallePelicula : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"]);

                    cargarPelicula(id);
                }
            }

            if (Session["Usuario"] != null)
            {
                Usuario usuario =
                    (Usuario)Session["Usuario"];

                btnBajaPelicula.Visible =
                    usuario.EsAdmin;
            }
        }

        private void cargarPelicula(int id)
        {
            PeliculaNegocio negocio = new PeliculaNegocio();

            Pelicula pelicula =
                negocio.listar().Find(x => x.IdPelicula == id);

            if (pelicula != null)
            {
                imgPelicula.ImageUrl = pelicula.URLImagen;

                lblTitulo.Text = pelicula.Titulo;

                lblDescripcion.Text = pelicula.Descripcion;

                lblDuracion.Text = pelicula.DuracionMinutos + " min";

                lblFechaEstreno.Text = pelicula.FechaEstreno.ToString("dd/MM/yyyy");

                lblDirector.Text = pelicula.Director.Nombre + " " + pelicula.Director.Apellido;

                lblClasificacion.Text = pelicula.Clasificacion.Descripcion;

                lblVisualizaciones.Text = pelicula.ContadorVisualizaciones.ToString("N0");

                lblCalificacion.Text = pelicula.PromedioCalificacion.ToString("0.0");

                lnkTrailer.NavigateUrl = pelicula.URLTrailer;

                repGeneros.DataSource = pelicula.Generos;
                repGeneros.DataBind();

                repActores.DataSource = pelicula.Actores;
                repActores.DataBind();

                ReseniaNegocio negocioResenia = new ReseniaNegocio();
                repResenias.DataSource = negocioResenia.listarPorPelicula(id);
                repResenias.DataBind();
            }
        }

        protected void btnWatchlist_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["Usuario"] == null)
                {
                    Response.Redirect("Login.aspx");
                }

                Usuario usuario = (Usuario)Session["Usuario"];

                if (usuario.SuscripcionActual.IdSuscripcion != 3)
                {
                    lblMensaje.CssClass = "text-warning d-block mt-3 text-center fw-bold";
                    lblMensaje.Text = "⚠ Esta función está disponible solo para usuarios Premium.";
                    return;
                }

                int idPelicula = int.Parse(Request.QueryString["id"]);

                PeliculaNegocio negocio = new PeliculaNegocio();

                negocio.agregarPeliculaDeWatchlistDeUsuario(usuario.IdUsuario, idPelicula);

                lblMensaje.CssClass = "text-success d-block mt-3 text-center fw-bold";

                lblMensaje.Text = "✅ Película agregada a tu watchlist.";

                Response.Redirect("Watchlist.aspx");
            }
            catch (Exception ex)
            {
                // Mensajes del RAISERROR
                lblMensaje.CssClass = "text-danger d-block mt-3 text-center fw-bold";
                lblMensaje.Text = "❌ " + ex.Message;
            }
        }

        protected void btnReproducir_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["Usuario"] == null)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                Usuario usuario = (Usuario)Session["Usuario"];

                int idPelicula = int.Parse(Request.QueryString["id"]);

                PeliculaNegocio negocio = new PeliculaNegocio();

                negocio.registrarVisualizacion(usuario.IdUsuario, idPelicula);

                lblMensaje.CssClass = "alert alert-success mt-3 text-center";
                lblMensaje.Text = "✅ Reproducción iniciada.";
                lblMensaje.Visible = true;

            }
            catch (Exception ex)
            {
                // Mostrar RAISERROR del SP
                lblMensaje.CssClass = "alert alert-danger mt-3 text-center";
                lblMensaje.Text = "❌ " + ex.Message;
                lblMensaje.Visible = true;
            }
        }

        protected void btnResenia_Click(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            Usuario usuario = (Usuario)Session["Usuario"];

            //if (usuario.SuscripcionActual.IdSuscripcion != 2 && usuario.SuscripcionActual.IdSuscripcion != 3)
            //{
            //    lblMensaje.Visible = true;

            //    lblMensaje.CssClass = "alert alert-warning mt-3 text-center";

            //    lblMensaje.Text = "⚠ Necesitás una suscripción Estándar o Premium para dejar reseñas.";

            //    return;
            //}

            int idPelicula = int.Parse(Request.QueryString["id"]);

            Response.Redirect("RegistroResenia.aspx?id=" + idPelicula);
        }

        protected void btnBajaPelicula_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["Usuario"] == null)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                Usuario usuario = (Usuario)Session["Usuario"];

                if (!usuario.EsAdmin)
                {
                    lblMensaje.CssClass = "alert alert-warning mt-3 text-center";
                    lblMensaje.Text = "No tenés permisos para dar de baja películas.";
                    lblMensaje.Visible = true;
                    return;
                }

                int idPelicula = int.Parse(Request.QueryString["id"]);

                PeliculaNegocio negocio = new PeliculaNegocio();

                negocio.bajaLogicaPelicula(idPelicula);

                lblMensaje.CssClass = "alert alert-success mt-3 text-center";
                lblMensaje.Text = "Película dada de baja correctamente. Las watchlists asociadas fueron actualizadas.";
                lblMensaje.Visible = true;
            }
            catch (Exception ex)
            {
                lblMensaje.CssClass = "alert alert-danger mt-3 text-center";
                lblMensaje.Text = "❌ " + ex.Message;
                lblMensaje.Visible = true;
            }
        }
    }
}