using BE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repositories.SqlServer.Adapters
{
	public static class EmpresaAdapter
	{
		public static Empresa Adapt(object[] values)
		{
			return new Empresa()
			{
				Id = Guid.Parse(values[(int)Columnas.ID].ToString()),
				Nombre = values[(int)Columnas.NOMBRE].ToString(),
				Habilitado = bool.Parse(values[(int)Columnas.HABILITADO].ToString())
			};
		}

		private enum Columnas
		{
			ID,
			NOMBRE,
			HABILITADO
		}
	}
}
