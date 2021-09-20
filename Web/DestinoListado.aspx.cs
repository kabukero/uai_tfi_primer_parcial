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
	public partial class DestinoListado : System.Web.UI.Page
	{
		private IGenericBusinessLogic<Empresa> empresaService;
		private IGenericBusinessLogic<Destino> destinoService;

		protected void Page_Load(object sender, EventArgs e)
		{
			destinoService = new DestinoService();
			empresaService = new EmpresaService();
			if(!IsPostBack)
			{
				DDLEmpresa.SelectedIndex = -1;
				ChkHabilitado.Checked = true;
				Enlazar();
				EnlazarDDL();
			}
		}

		private void Enlazar()
		{
			gvDestinos.DataSource = destinoService.GetAll();
			gvDestinos.DataBind();
		}

		private void EnlazarDDL()
		{
			DDLEmpresa.DataValueField = "Id";
			DDLEmpresa.DataTextField = "Nombre";
			DDLEmpresa.DataSource = empresaService.GetAll().Where(x => x.Habilitado);
			DDLEmpresa.DataBind();
		}

		protected void gvDestinos_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			switch(e.CommandName)
			{
				case "Eliminar":
					destinoService.Remove(Guid.Parse(e.CommandArgument.ToString()));
					Enlazar();
					break;
				case "Seleccionar":
					var destino = destinoService.GetOne(Guid.Parse(e.CommandArgument.ToString()));
					HidId.Value = destino.Id.ToString();
					TxtNombre.Text = destino.Nombre;
					DDLEmpresa.SelectedValue = destino.Empresa.Id.ToString();
					TxtPrefijoInternacional.Text = destino.PrefijoInternacional;
					ChkHabilitado.Checked = destino.Habilitado;
					break;
			}
		}

		private void LimpiarForm()
		{
			HidId.Value = string.Empty;
			TxtNombre.Text = string.Empty;
			TxtPrefijoInternacional.Text = string.Empty;
			ChkHabilitado.Checked = true;
		}

		protected void Guardar_Click(object sender, EventArgs e)
		{
			var esAlta = string.IsNullOrEmpty(HidId.Value);
			var id = esAlta ? Guid.NewGuid() : Guid.Parse(HidId.Value);
			var nombre = TxtNombre.Text;
			var prefijoInternacional = TxtPrefijoInternacional.Text;
			var empresa = new Empresa() { Id = Guid.Parse(DDLEmpresa.SelectedValue) };
			var habilitado = ChkHabilitado.Checked;
			var destino = new Destino() { Id = id, Nombre = nombre, Empresa = empresa, PrefijoInternacional = prefijoInternacional, Habilitado = habilitado };

			if(esAlta)
				destinoService.Create(destino);
			else
				destinoService.Update(destino);

			Enlazar();
			LimpiarForm();
		}

		protected void Limpiar_Click(object sender, EventArgs e)
		{
			LimpiarForm();
		}
	}
}