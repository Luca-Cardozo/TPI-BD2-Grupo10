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

        }
    }
}