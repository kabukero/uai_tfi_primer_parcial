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
	public partial class FacturaListado : System.Web.UI.Page
	{
		private IGenericBusinessLogic<Cliente> serviceCliente;
		private IGenericBusinessLogic<FacturaCabecera> serviceFactura;

		protected void Page_Load(object sender, EventArgs e)
		{
			serviceCliente = new ClienteService();
			serviceFactura = new FacturaService();

			if(!IsPostBack)
			{
				Enlazar();
				EnlazarDDL();
			}
		}

		private void Enlazar()
		{
			gvFacturas.DataSource = serviceFactura.GetAll();
			gvFacturas.DataBind();
		}

		private void EnlazarDDL()
		{
			DDLCliente.DataValueField = "Id";
			DDLCliente.DataTextField = "NombreCompleto";
			DDLCliente.DataSource = serviceCliente.GetAll().Where(x => x.Habilitado);
			DDLCliente.DataBind();
		}

		protected void Guardar_Click(object sender, EventArgs e)
		{
			var id = Guid.NewGuid();
			var cliente = new Cliente() { Id = Guid.Parse(DDLCliente.SelectedValue) };
			var fechaFactura = DateTime.Parse(CalFechaLLamada.SelectedDate.ToString("yyyy/MM/dd"));
			var factura = new FacturaCabecera() { Id = id, Cliente = cliente, FechaFacturacion = fechaFactura };

			serviceFactura.Create(factura);

			Enlazar();
		}
	}
}