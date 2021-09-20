using BE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repositories.SqlServer.Adapters
{
	internal static class ClienteAdapter
	{
		public static Cliente Adapt(object[] values)
		{
			return new Cliente()
			{
				Id = Guid.Parse(values[(int)Columnas.ID].ToString()),
				Nombre = values[(int)Columnas.NOMBRE].ToString(),
				Apellido = values[(int)Columnas.APELLIDO].ToString(),
				DNI = values[(int)Columnas.DNI].ToString(),
				Habilitado = bool.Parse(values[(int)Columnas.HABILITADO].ToString())
			};
		}

		private enum Columnas
		{
			ID,
			NOMBRE,
			APELLIDO,
			DNI,
			HABILITADO
		}
	}
}
