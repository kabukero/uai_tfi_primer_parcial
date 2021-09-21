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
	public partial class ClienteForm : System.Web.UI.Page
	{
		private IGenericBusinessLogic<Cliente> service;

		protected void Page_Load(object sender, EventArgs e)
		{
			service = new ClienteService();
			TxtId.Value = Request.QueryString["Id"];
			ChkHabilitado.Checked = true;
			if(!IsPostBack && !string.IsNullOrEmpty(TxtId.Value))
				LlenarForm();
		}

		private void LlenarForm()
		{
			Cliente cliente = service.GetOne(Guid.Parse(TxtId.Value));
			TxtNombre.Text = cliente.Nombre;
			TxtApellido.Text = cliente.Apellido;
			TxtDNI.Text = cliente.DNI;
			ChkHabilitado.Checked = cliente.Habilitado;
		}

		protected void Guardar_Click(object sender, EventArgs e)
		{
			var id = string.IsNullOrEmpty(TxtId.Value) ? Guid.NewGuid() : Guid.Parse(TxtId.Value);
			var nombre = TxtNombre.Text;
			var apellido = TxtApellido.Text;
			var dni = TxtDNI.Text;
			var habilitado = ChkHabilitado.Checked;

			var cliente = new Cliente(id, nombre, apellido, dni, habilitado);

			if(string.IsNullOrEmpty(TxtId.Value))
				service.Create(cliente);
			else
				service.Update(cliente);

			Response.Redirect("ListadoClientes.aspx", false);
		}

	}
}
