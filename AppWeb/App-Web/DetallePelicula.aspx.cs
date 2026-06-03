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

    }
}