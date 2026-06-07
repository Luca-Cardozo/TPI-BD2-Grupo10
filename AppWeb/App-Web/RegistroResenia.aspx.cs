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
    public partial class RegistroResenia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                cargarCalificaciones();
                cargarDatosPelicula();

                cargarReseniaExistente();
            }
        }

        private void cargarCalificaciones()
        {
            ddlCalificacion.Items.Add(new ListItem("Seleccione un puntaje", "0"));

            for (int i = 1; i <= 10; i++)
            {
                ddlCalificacion.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
        }

        private void cargarReseniaExistente()
        {
            try
            {
                Usuario usuario = (Usuario)Session["Usuario"];

                int idPelicula = int.Parse(Request.QueryString["id"]);

                ReseniaNegocio negocio = new ReseniaNegocio();

                Resenia resenia = negocio.leerResenia(usuario.IdUsuario, idPelicula);

                if (resenia != null)
                {
                    txtComentario.Text = resenia.Comentario;
                    ddlCalificacion.SelectedValue = resenia.Calificacion.ToString();
                    btnGuardar.Text = "Actualizar reseña";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario usuario = (Usuario)Session["Usuario"];

                int idPelicula = int.Parse(Request.QueryString["id"]);

                if (string.IsNullOrWhiteSpace(txtComentario.Text))
                {
                    mostrarMensaje("El comentario es obligatorio.", "warning");
                    return;
                }

                if (ddlCalificacion.SelectedValue == "0")
                {
                    mostrarMensaje("Seleccioná una calificación.", "warning");
                    return;
                }

                ReseniaNegocio negocio = new ReseniaNegocio();

                negocio.registrarResenia(usuario.IdUsuario, idPelicula, txtComentario.Text.Trim(), int.Parse(ddlCalificacion.SelectedValue));

                mostrarMensaje("✅ Reseña guardada correctamente.", "success");

                Response.AddHeader("REFRESH", "3;URL=DetallePelicula.aspx?id=" + idPelicula);
            }
            catch (Exception ex)
            {
                // RAISERROR del SP
                mostrarMensaje("❌ " + ex.Message, "danger");
            }
        }

        private void mostrarMensaje(string mensaje, string tipo)
        {
            lblMensaje.Visible = true;
            lblMensaje.CssClass = $"alert alert-{tipo} mt-3 text-center";
            lblMensaje.Text = mensaje;
        }



        private void cargarDatosPelicula()
        {
            int idPelicula =
                int.Parse(Request.QueryString["id"]);

            PeliculaNegocio negocio =
                new PeliculaNegocio();

            Pelicula pelicula =
                negocio.listar().Find(
                    x => x.IdPelicula == idPelicula);

            if (pelicula != null)
            {
                imgPelicula.ImageUrl =
                    pelicula.URLImagen;

                lblTitulo.Text =
                    pelicula.Titulo;

                lblPromedio.Text =
                    pelicula.PromedioCalificacion
                    .ToString("0.0");
            }
        }
    }
}