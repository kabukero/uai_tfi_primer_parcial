using BE;
using DAL.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repositories.SqlServer.Adapters
{
	public class ReporteRecMesPromocionMesAdapter
	{
		public static ReporteRecMesPromocion Adapt(object[] values)
		{
			IGenericRepository<Promocion> repoPromocion = new PromocionRepository();
			FechaRepository repoMes = new FechaRepository();

			return new ReporteRecMesPromocion()
			{
				Promocion = repoPromocion.GetOne(Guid.Parse(values[(int)Columnas.PROMOCION_ID].ToString())),
				Mes = repoMes.GetOne(int.Parse(values[(int)Columnas.MES].ToString())),
				Importe = decimal.Parse(values[(int)Columnas.IMPORTE].ToString())
			};
		}

		private enum Columnas
		{
			PROMOCION_ID,
			MES,
			IMPORTE
		}
	}
}
