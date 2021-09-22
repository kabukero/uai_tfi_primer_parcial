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
	public partial class ReporteRecMesPromocion : System.Web.UI.Page
	{
		private IGenericBusinessLogic<Promocion> servicePromocion;
		private FechaService serviceFecha;
		private ReporteService reporteService;

		protected void Page_Load(object sender, EventArgs e)
		{
			servicePromocion = new PromocionService();
			serviceFecha = new FechaService();
			reporteService = new ReporteService();

			if(!IsPostBack)
			{
				EnlazarDDL();
			}
		}

		private void EnlazarDDL()
		{
			DDLPromocion.DataValueField = "Id";
			DDLPromocion.DataTextField = "Nombre";
			DDLPromocion.DataSource = servicePromocion.GetAll().Where(x => x.Habilitado);
			DDLPromocion.DataBind();

			DDLMes.DataValueField = "Numero";
			DDLMes.DataTextField = "Nombre";
			DDLMes.DataSource = serviceFecha.GetAll();
			DDLMes.DataBind();
		}

		protected void Enviar_Click(object sender, EventArgs e)
		{
			var mes = new Mes() { Numero = int.Parse(DDLMes.SelectedValue) };
			var promocion = new Promocion() { Id = Guid.Parse(DDLPromocion.SelectedValue) };

			gvReporte.DataSource = reporteService.GetReporteRecMesPromocion(promocion, mes);
			gvReporte.DataBind();
		}
	}
}