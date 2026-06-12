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
    public partial class RegistroUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarSuscripciones();
            }
        }

        private void cargarSuscripciones()
        {
            SuscripcionesNegocio negocio = new SuscripcionesNegocio();
            List<Suscripcion> lista = negocio.listar();

            ddlSuscripcion.Items.Clear();
            ddlSuscripcion.Items.Add(new ListItem("Seleccione una suscripción", "0"));

            foreach (Suscripcion item in lista)
            {
                ddlSuscripcion.Items.Add(new ListItem(item.Descripcion + " - $" + item.PrecioMensual.ToString("N2") + "/mes", item.IdSuscripcion.ToString()));
            }
        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            Page.Validate();

            if (!Page.IsValid)
                return;

            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            Usuario nuevoUsuario = new Usuario();

            try
            {

                if (ddlSuscripcion.SelectedValue == "0")
                {
                    lblMensaje.Text = "⚠️ Por favor, seleccione un tipo de suscripción.";
                    lblMensaje.CssClass = "alert alert-warning d-block";
                    return;
                }
                if (contieneNumeros(txtNombre.Text) || contieneNumeros(txtApellido.Text))
                {
                    lblMensaje.Text = "⚠️ El nombre y apellido no pueden contener números.";
                    lblMensaje.CssClass = "alert alert-warning d-block";
                    return;
                }

                nuevoUsuario.Nombre = txtNombre.Text.Trim();
                nuevoUsuario.Apellido = txtApellido.Text.Trim();
                nuevoUsuario.DNI = txtDNI.Text.Trim();
                nuevoUsuario.Email = txtEmail.Text.Trim();
                nuevoUsuario.Password = txtPassword.Text.Trim();
                nuevoUsuario.Telefono = txtTelefono.Text.Trim();

                int idSuscripcionSeleccionada = Convert.ToInt32(ddlSuscripcion.SelectedValue);


                usuarioNegocio.registrarUsuario(nuevoUsuario, idSuscripcionSeleccionada);

                nuevoUsuario.SuscripcionActual = new Suscripcion();
                nuevoUsuario.SuscripcionActual.IdSuscripcion = idSuscripcionSeleccionada;


                nuevoUsuario.EsAdmin = false;


                Session["Usuario"] = nuevoUsuario;


                Response.Redirect("Home.aspx", false);
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "❌ Error al registrar el usuario: " + ex.Message;
                lblMensaje.CssClass = "alert alert-danger d-block";
            }


        }

        private bool contieneNumeros(string texto)
        {
            return texto.Any(char.IsDigit);
        }
    }
}