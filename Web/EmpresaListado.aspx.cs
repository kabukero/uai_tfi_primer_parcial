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
	public partial class EmpresaListado : System.Web.UI.Page
	{
		private IGenericBusinessLogic<Empresa> empresaService;

		protected void Page_Load(object sender, EventArgs e)
		{
			empresaService = new EmpresaService();
			if(!IsPostBack)
			{
				ChkHabilitado.Checked = true;
				Enlazar();
			}
		}

		private void Enlazar()
		{
			gvEmpresas.DataSource = empresaService.GetAll();
			gvEmpresas.DataBind();
		}

		protected void gvTelefono_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			switch(e.CommandName)
			{
				case "Eliminar":
					empresaService.Remove(Guid.Parse(e.CommandArgument.ToString()));
					Enlazar();
					break;
				case "Seleccionar":
					var empresa = empresaService.GetOne(Guid.Parse(e.CommandArgument.ToString()));
					HidId.Value = empresa.Id.ToString();
					TxtNombre.Text = empresa.Nombre;
					ChkHabilitado.Checked = empresa.Habilitado;
					break;
			}
		}

		private void LimpiarForm()
		{
			HidId.Value = string.Empty;
			TxtNombre.Text = string.Empty;
			ChkHabilitado.Checked = true;
		}

		protected void Guardar_Click(object sender, EventArgs e)
		{
			var esAlta = string.IsNullOrEmpty(HidId.Value);
			var id = esAlta ? Guid.NewGuid() : Guid.Parse(HidId.Value);
			var nombre = TxtNombre.Text;
			var habilitado = ChkHabilitado.Checked;
			var empresa = new Empresa() { Id = id, Nombre = nombre, Habilitado = habilitado };

			if(esAlta)
				empresaService.Create(empresa);
			else
				empresaService.Update(empresa);

			Enlazar();
			LimpiarForm();
		}
	}
}
