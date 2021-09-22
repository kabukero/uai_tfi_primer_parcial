using BE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repositories.SqlServer.Adapters
{
	public class ReporteRecaudacionTotalMesAdapter
	{
		public static ReporteRecaudacionTotalMes Adapt(object[] values)
		{
			FechaRepository repoMes = new FechaRepository();

			return new ReporteRecaudacionTotalMes()
			{
				Mes = repoMes.GetOne(int.Parse(values[(int)Columnas.MES].ToString())),
				Importe = decimal.Parse(values[(int)Columnas.IMPORTE].ToString())
			};
		}

		private enum Columnas
		{
			MES,
			IMPORTE
		}
	}
}
