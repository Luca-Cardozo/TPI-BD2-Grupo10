using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace App_Web
{
    public partial class CatalogoPeliculas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarDropDownList();
            }
        }

        private void cargarDropDownList()
        {
            GeneroNegocio generoNegocio = new GeneroNegocio();

            ddlGenero.DataSource = generoNegocio.listar();
            ddlGenero.DataValueField = "IdGenero";
            ddlGenero.DataTextField = "Descripcion";
            ddlGenero.DataBind();

            ddlGenero.Items.Insert(0, new ListItem("Todos", "0"));

            ClasificacionNegocio clasificacionNegocio = new ClasificacionNegocio();

            ddlClasificacion.DataSource = clasificacionNegocio.listar();
            ddlClasificacion.DataValueField = "IdClasificacion";
            ddlClasificacion.DataTextField = "Descripcion";
            ddlClasificacion.DataBind();

            ddlClasificacion.Items.Insert(0, new ListItem("Todos", "0"));

            DirectorNegocio directorNegocio = new DirectorNegocio();

            ddlDirector.DataSource = directorNegocio.listar();
            ddlDirector.DataValueField = "IdDirector";
            ddlDirector.DataTextField = "NombreCompleto";
            ddlDirector.DataBind();

            ddlDirector.Items.Insert(0, new ListItem("Todos", "0"));

            ActorNegocio actorNegocio = new ActorNegocio();

            ddlActor.DataSource = actorNegocio.listar();
            ddlActor.DataValueField = "IdActor";
            ddlActor.DataTextField = "NombreCompleto";
            ddlActor.DataBind();

            ddlActor.Items.Insert(0, new ListItem("Todos", "0"));

            ddlAnios.Items.Clear();
            ddlAnios.Items.Add(new ListItem("Todos", "0"));

            for (int i = DateTime.Now.Year; i >= 1900; i--)
            {
                ddlAnios.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
        }


        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string titulo = txtTitulo.Text.Trim();
            int? idGenero = ddlGenero.SelectedValue == "0" ? (int?)null : int.Parse(ddlGenero.SelectedValue);
            int? idClasificacion = ddlClasificacion.SelectedValue == "0" ? (int?)null : int.Parse(ddlClasificacion.SelectedValue);
            int? idDirector = ddlDirector.SelectedValue == "0" ? (int?)null : int.Parse(ddlDirector.SelectedValue);
            int? idActor = ddlActor.SelectedValue == "0" ? (int?)null : int.Parse(ddlActor.SelectedValue);
            int? anio = ddlAnios.SelectedValue == "0" ? (int?)null : int.Parse(ddlAnios.SelectedValue);

            PeliculaNegocio negocio = new PeliculaNegocio();
            dgvPeliculas.DataSource = negocio.SP_BuscarPeliculas(titulo, idGenero, idClasificacion, idDirector, idActor, anio);
            dgvPeliculas.DataBind();
        }

        protected void btnCatalogoCompleto_Click(object sender, EventArgs e)
        {
            PeliculaNegocio negocio = new PeliculaNegocio();
            dgvPeliculas.DataSource = negocio.SP_BuscarPeliculas();
            dgvPeliculas.DataBind();
        }

        protected void dgvPeliculas_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idPelicula = (int)dgvPeliculas.SelectedDataKey.Value;

            Response.Redirect("DetallePelicula.aspx?id=" + idPelicula);
        }
    }
}