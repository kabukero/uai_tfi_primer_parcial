using BE;
using BLL.Contracts;
using BLL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
	public partial class ListadoClientes : System.Web.UI.Page
	{
		private IGenericBusinessLogic<Cliente> service;

		protected void Page_Load(object sender, EventArgs e)
		{
			service = new ClienteService();
			Enlazar();
		}

		private void Enlazar()
		{
			gvClientes.DataSource = service.GetAll();
			gvClientes.DataBind();
		}

		protected void gvClientes_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			service = new ClienteService();
			service.Remove(Guid.Parse(e.CommandArgument.ToString()));
		}

	}
}
