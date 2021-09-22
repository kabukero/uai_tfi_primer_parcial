using BE;
using BLL.Contracts;
using BLL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
	public partial class ReportePorcLlamadas : System.Web.UI.Page
	{
		private IGenericBusinessLogic<Cliente> serviceCliente;
		private ReporteService reporteService;

		protected void Page_Load(object sender, EventArgs e)
		{
			serviceCliente = new ClienteService();
			reporteService = new ReporteService();

			if(!IsPostBack)
			{
				EnlazarDDL();
			}
		}

		private void EnlazarDDL()
		{
			DDLCliente.DataValueField = "Id";
			DDLCliente.DataTextField = "NombreCompleto";
			DDLCliente.DataSource = serviceCliente.GetAll().Where(x => x.Habilitado);
			DDLCliente.DataBind();
		}

		protected void Enviar_Click(object sender, EventArgs e)
		{
			var cliente = new Cliente() { Id = Guid.Parse(DDLCliente.SelectedValue) };

			gvReporte.DataSource = reporteService.GetReportePorcentajeLlamadasTipoGeneralCliente(cliente);
			gvReporte.DataBind();
		}
	}
}