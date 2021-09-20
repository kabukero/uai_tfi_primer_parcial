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
	public partial class PromocionListado : System.Web.UI.Page
	{
		private IGenericBusinessLogic<Promocion> promocionService;
		protected void Page_Load(object sender, EventArgs e)
		{
			promocionService = new PromocionService();
			if(!IsPostBack)
			{
				ChkHabilitado.Checked = true;
				Enlazar();
			}
		}

		private void Enlazar()
		{
			gvPromociones.DataSource = promocionService.GetAll();
			gvPromociones.DataBind();
		}

		protected void Promociones_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			switch(e.CommandName)
			{
				case "Eliminar":
					promocionService.Remove(Guid.Parse(e.CommandArgument.ToString()));
					Enlazar();
					break;
				case "Seleccionar":
					var promocion = promocionService.GetOne(Guid.Parse(e.CommandArgument.ToString()));
					HidId.Value = promocion.Id.ToString();
					TxtNombre.Text = promocion.Nombre;
					TxtCostoMinuto.Text = promocion.CostoMinuto.ToString();
					TxtCostoAdicional.Text = promocion.CostoAdicional.ToString();
					ChkHabilitado.Checked = promocion.Habilitado;
					break;
			}
		}

		private void LimpiarForm()
		{
			HidId.Value = string.Empty;
			TxtNombre.Text = string.Empty;
			TxtCostoMinuto.Text = string.Empty;
			TxtCostoAdicional.Text = string.Empty;
			ChkHabilitado.Checked = true;
		}

		protected void Guardar_Click(object sender, EventArgs e)
		{
			var esAlta = string.IsNullOrEmpty(HidId.Value);
			var id = esAlta ? Guid.NewGuid() : Guid.Parse(HidId.Value);
			var nombre = TxtNombre.Text;
			var costoMinuto = decimal.Parse(TxtCostoMinuto.Text);
			var costoAdicional = decimal.Parse(TxtCostoAdicional.Text);
			var habilitado = ChkHabilitado.Checked;
			var promocion = new Promocion() { Id = id, Nombre = nombre, CostoMinuto = costoMinuto, CostoAdicional = costoAdicional, Habilitado = habilitado };

			if(esAlta)
				promocionService.Create(promocion);
			else
				promocionService.Update(promocion);

			Enlazar();
			LimpiarForm();
		}

		protected void Limpiar_Click(object sender, EventArgs e)
		{
			LimpiarForm();
		}
	}
}
