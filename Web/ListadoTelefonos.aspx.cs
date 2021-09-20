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
	public partial class ListadoTelefonos : System.Web.UI.Page
	{
		private IGenericBusinessLogic<Telefono> serviceTelefono;
		private IGenericBusinessLogic<Cliente> serviceCliente;
		private IGenericBusinessLogic<TelefonoTipo> serviceTelefonoTipo;

		protected void Page_Load(object sender, EventArgs e)
		{
			serviceTelefono = new TelefonoService();
			serviceCliente = new ClienteService();
			serviceTelefonoTipo = new TelefonoTipoService();

			if(!IsPostBack)
			{
				ChkHabilitado.Checked = true;
				Enlazar();
				EnlazarDDL();
			}
		}

		private void Enlazar()
		{
			gvTelefonos.DataSource = serviceTelefono.GetAll();
			gvTelefonos.DataBind();
		}

		private void EnlazarDDL()
		{
			DDLCliente.DataValueField = "Id";
			DDLCliente.DataTextField = "NombreCompleto";
			DDLCliente.DataSource = serviceCliente.GetAll().Where(x => x.Habilitado);
			DDLCliente.DataBind();

			DLLTipo.DataValueField = "Id";
			DLLTipo.DataTextField = "Nombre";
			DLLTipo.DataSource = serviceTelefonoTipo.GetAll();
			DLLTipo.DataBind();
		}

		protected void gvTelefono_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			serviceTelefono.Remove(Guid.Parse(e.CommandArgument.ToString()));
			Enlazar();
			EnlazarDDL();
		}

		protected void Guardar_Click(object sender, EventArgs e)
		{
			var cliente = new Cliente() { Id = Guid.Parse(DDLCliente.SelectedValue) };
			var tipo = new TelefonoTipo() { Id = Guid.Parse(DLLTipo.SelectedValue) };
			var numero = TxtNumero.Text;
			var habilitado = ChkHabilitado.Checked;

			var telefono = new Telefono() { Id = Guid.NewGuid(), Numero = numero, Cliente = cliente, TelefonoTipo = tipo, Habilitado = habilitado };

			serviceTelefono.Create(telefono);

			Enlazar();
			EnlazarDDL();
		}
	}
}
