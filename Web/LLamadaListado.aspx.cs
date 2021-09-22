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
	public partial class LLamadaListado : System.Web.UI.Page
	{
		private IGenericBusinessLogic<Llamada> serviceLlamada;
		private IGenericBusinessLogic<Telefono> serviceTelefono;
		private IGenericBusinessLogic<Destino> serviceDestino;
		private IGenericBusinessLogic<Promocion> servicePromocion;

		protected void Page_Load(object sender, EventArgs e)
		{
			serviceLlamada = new LlamadaService();
			serviceTelefono = new TelefonoService();
			serviceDestino = new DestinoService();
			servicePromocion = new PromocionService();

			if(!IsPostBack)
			{
				Enlazar();
				EnlazarDDL();
			}
		}

		private void Enlazar()
		{
			gvLlamadas.DataSource = serviceLlamada.GetAll();
			gvLlamadas.DataBind();
		}

		private void EnlazarDDL()
		{
			DDLTelefonoOrigen.DataValueField = "Id";
			DDLTelefonoOrigen.DataTextField = "TelefonoCliente";
			DDLTelefonoOrigen.DataSource = serviceTelefono.GetAll().Where(x => x.Habilitado);
			DDLTelefonoOrigen.DataBind();

			DLLDestinoOrigen.DataValueField = "Id";
			DLLDestinoOrigen.DataTextField = "Nombre";
			DLLDestinoOrigen.DataSource = serviceDestino.GetAll().Where(x => x.Habilitado);
			DLLDestinoOrigen.DataBind();

			DDLTelefonoDestino.DataValueField = "Id";
			DDLTelefonoDestino.DataTextField = "TelefonoCliente";
			DDLTelefonoDestino.DataSource = serviceTelefono.GetAll().Where(x => x.Habilitado);
			DDLTelefonoDestino.DataBind();

			DLLDestinoDestino.DataValueField = "Id";
			DLLDestinoDestino.DataTextField = "Nombre";
			DLLDestinoDestino.DataSource = serviceDestino.GetAll().Where(x => x.Habilitado);
			DLLDestinoDestino.DataBind();

			DLLPromocion.DataValueField = "Id";
			DLLPromocion.DataTextField = "Nombre";
			DLLPromocion.DataSource = servicePromocion.GetAll().Where(x => x.Habilitado);
			DLLPromocion.DataBind();

		}

		private void LimpiarForm()
		{
			TxtDuracionMinutos.Text = string.Empty;
		}

		protected void Guardar_Click(object sender, EventArgs e)
		{
			var telefonoOrigen = new Telefono() { Id = Guid.Parse(DDLTelefonoOrigen.SelectedValue) };
			var destinoOrigen = new Destino() { Id = Guid.Parse(DLLDestinoOrigen.SelectedValue) };
			var telefonoDestino = new Telefono() { Id = Guid.Parse(DDLTelefonoDestino.SelectedValue) };
			var destinoDestino = new Destino() { Id = Guid.Parse(DLLDestinoDestino.SelectedValue) };
			var promocion = new Promocion() { Id = Guid.Parse(DLLPromocion.SelectedValue) };
			var duracionMinutos = int.Parse(TxtDuracionMinutos.Text);
			var fechaLLamada = DateTime.Parse(CalFechaLLamada.SelectedDate.ToString("yyyy/MM/dd"));

			var llamada = new Llamada() { Id = Guid.NewGuid(), TelefonoOrigen = telefonoOrigen,
				DestinoOrigen = destinoOrigen,
				TelefonoDestino = telefonoDestino,
				DestinoDestino = destinoDestino,
				Promocion = promocion,
				DuracionMinutos = duracionMinutos,
				FechaLlamada = fechaLLamada
			};

			serviceLlamada.Create(llamada);

			Enlazar();
			EnlazarDDL();
			LimpiarForm();
		}
	}
}
