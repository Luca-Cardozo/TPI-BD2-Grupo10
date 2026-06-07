using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace App_Web
{
    public partial class RankingMejoresPuntuadas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarRanking();
            }
        }

        private void cargarRanking()
        {
            try
            {
                PeliculaNegocio negocio = new PeliculaNegocio();

                repRanking.DataSource = negocio.rankingMejoresPuntuadas();
                repRanking.DataBind();
            }
            catch (Exception ex)
            {
                lblMensaje.Visible = true;
                lblMensaje.CssClass = "alert alert-danger d-block text-center";
                lblMensaje.Text = " No se pudo cargar el ranking. " + ex.Message;
            }
        }
    }
}