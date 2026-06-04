using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace App_Web
{
    public partial class ResumenActividadUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarEstadisticas();
            }
        }

        private void cargarEstadisticas()
        {
            EstadisticasNegocio negocio = new EstadisticasNegocio();
            dgvActividadUsuarios.DataSource = negocio.listarResumenActividad();
            dgvActividadUsuarios.DataBind();
        }

    }
}