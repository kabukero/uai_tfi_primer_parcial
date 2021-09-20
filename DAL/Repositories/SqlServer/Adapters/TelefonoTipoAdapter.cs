using BE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repositories.SqlServer.Adapters
{
	public class TelefonoTipoAdapter
	{
		public static TelefonoTipo Adapt(object[] values)
		{
			return new TelefonoTipo()
			{
				Id = Guid.Parse(values[(int)Columnas.ID].ToString()),
				Nombre = values[(int)Columnas.NOMBRE].ToString()
			};
		}

		private enum Columnas
		{
			ID,
			NOMBRE
		}
	}
}
