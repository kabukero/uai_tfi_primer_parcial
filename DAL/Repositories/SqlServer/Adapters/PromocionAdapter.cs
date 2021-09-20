using BE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repositories.SqlServer.Adapters
{
	class PromocionAdapter
	{
		public static Promocion Adapt(object[] values)
		{

			return new Promocion()
			{
				Id = Guid.Parse(values[(int)Columnas.ID].ToString()),
				Nombre = values[(int)Columnas.NOMBRE].ToString(),
				CostoMinuto = decimal.Parse(values[(int)Columnas.COSTO_MINUTO].ToString()),
				CostoAdicional = decimal.Parse(values[(int)Columnas.COSTO_ADICIONAL].ToString()),
				Habilitado = bool.Parse(values[(int)Columnas.HABILITADO].ToString())
			};
		}

		private enum Columnas
		{
			ID,
			NOMBRE,
			COSTO_MINUTO,
			COSTO_ADICIONAL,
			HABILITADO
		}
	}
}
