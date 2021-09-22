using BE;
using DAL.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repositories.SqlServer.Adapters
{
	public class ReporteCargosMesClienteAdapter
	{
		public static ReporteCargosMesCliente Adapt(object[] values)
		{
			IGenericRepository<Cliente> repoCliente = new ClienteRepository();
			FechaRepository repoMes = new FechaRepository();

			return new ReporteCargosMesCliente()
			{
				Cliente = repoCliente.GetOne(Guid.Parse(values[(int)Columnas.CLIENTE_ID].ToString())),
				Mes = repoMes.GetOne(int.Parse(values[(int)Columnas.MES].ToString())),
				Importe = decimal.Parse(values[(int)Columnas.IMPORTE].ToString())
			};
		}

		private enum Columnas
		{
			CLIENTE_ID,
			MES,
			IMPORTE
		}
	}
}
