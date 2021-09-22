using BE;
using DAL.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repositories.SqlServer.Adapters
{
	public class ReportePorcentajeLlamadasTipoGeneralClienteAdapter
	{

		public static ReportePorcentajeLlamadasTipoGeneralCliente Adapt(object[] values)
		{
			IGenericRepository<Promocion> repoPromocion = new PromocionRepository();
			IGenericRepository<Cliente> repoCliente = new ClienteRepository();

			return new ReportePorcentajeLlamadasTipoGeneralCliente()
			{
				Cliente = repoCliente.GetOne(Guid.Parse(values[(int)Columnas.CLIENTE_ID].ToString())),
				Promocion = repoPromocion.GetOne(Guid.Parse(values[(int)Columnas.PROMOCION_ID].ToString())),
				Cantidad = int.Parse(values[(int)Columnas.CANTIDAD].ToString()),
				Porcentaje = decimal.Parse(values[(int)Columnas.PORCENTAJE].ToString())
			};
		}

		private enum Columnas
		{
			CLIENTE_ID,
			PROMOCION_ID,
			CANTIDAD,
			PORCENTAJE
		}

	}
}
