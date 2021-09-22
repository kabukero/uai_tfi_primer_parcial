using BE;
using BLL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
	public partial class ReporteRecTotalMes : System.Web.UI.Page
	{
		private FechaService serviceFecha;
		private ReporteService reporteService;

		protected void Page_Load(object sender, EventArgs e)
		{
			serviceFecha = new FechaService();
			reporteService = new ReporteService();

			if(!IsPostBack)
			{
				EnlazarDDL();
			}

		}
		private void EnlazarDDL()
		{
			DDLMes.DataValueField = "Numero";
			DDLMes.DataTextField = "Nombre";
			DDLMes.DataSource = serviceFecha.GetAll();
			DDLMes.DataBind();
		}

		protected void Enviar_Click(object sender, EventArgs e)
		{
			var mes = new Mes() { Numero = int.Parse(DDLMes.SelectedValue) };
			gvReporte.DataSource = reporteService.GetReporteRecTotalMes(mes);
			gvReporte.DataBind();
		}
	}
}