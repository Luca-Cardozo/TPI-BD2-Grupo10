using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace App_Web
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarPeliculas();
            }
        }

        private void cargarPeliculas()
        {
            PeliculaNegocio negocio = new PeliculaNegocio();

            repPeliculas.DataSource = negocio.listar();
            repPeliculas.DataBind();
        }
    }
}