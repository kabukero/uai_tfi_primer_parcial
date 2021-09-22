using BE;
using DAL.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repositories.SqlServer.Adapters
{
	public class FacturaAdapter
	{
		public static FacturaCabecera Adapt(object[] values)
		{
			IGenericRepository<Cliente> repoCliente = new ClienteRepository();

			return new FacturaCabecera()
			{
				Id = Guid.Parse(values[(int)Columnas.ID].ToString()),
				Cliente = repoCliente.GetOne(Guid.Parse(values[(int)Columnas.CLIENTE_ID].ToString())),
				FechaFacturacion = DateTime.Parse(values[(int)Columnas.FECHA_FACTURACION].ToString()),
				MontoTotal = decimal.Parse(values[(int)Columnas.MONTO_TOTAL].ToString())
			};
		}

		private enum Columnas
		{
			ID,
			CLIENTE_ID,
			FECHA_FACTURACION,
			MONTO_TOTAL
		}
	}
}
