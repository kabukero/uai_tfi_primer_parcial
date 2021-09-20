using BE;
using DAL.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repositories.SqlServer.Adapters
{
	public class LLamadaAdapter
	{
		public static Llamada Adapt(object[] values)
		{
			IGenericRepository<Promocion> repoPromocion = new PromocionRepository();
			IGenericRepository<Destino> repoDestino = new DestinoRepository();
			IGenericRepository<Telefono> repoTelefono = new TelefonoRepository();

			return new Llamada()
			{
				Id = Guid.Parse(values[(int)Columnas.ID].ToString()),
				DestinoOrigen = repoDestino.GetOne(Guid.Parse(values[(int)Columnas.TELEFONO_ORIGEN_ID].ToString())),
				TelefonoOrigen = repoTelefono.GetOne(Guid.Parse(values[(int)Columnas.DESTINO_ORIGEN_ID].ToString())),
				TelefonoDestino = repoTelefono.GetOne(Guid.Parse(values[(int)Columnas.TELEFONO_DESTINO_ID].ToString())),
				DestinoDestino = repoDestino.GetOne(Guid.Parse(values[(int)Columnas.DESTINO_DESTINO_ID].ToString())),
				DuracionMinutos = int.Parse(values[(int)Columnas.DURACION_MINUTOS].ToString()),
				Promocion = repoPromocion.GetOne(Guid.Parse(values[(int)Columnas.PROMOCION_ID].ToString())),
				FechaLlamada = DateTime.Parse(values[(int)Columnas.FECHA_LLAMADA].ToString())
			};
		}

		private enum Columnas
		{
			ID,
			TELEFONO_ORIGEN_ID,
			DESTINO_ORIGEN_ID,
			TELEFONO_DESTINO_ID,
			DESTINO_DESTINO_ID,
			DURACION_MINUTOS,
			PROMOCION_ID,
			FECHA_LLAMADA,
		}
	}
}