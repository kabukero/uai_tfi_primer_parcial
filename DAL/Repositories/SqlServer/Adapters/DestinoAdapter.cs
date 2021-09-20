using BE;
using DAL.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repositories.SqlServer.Adapters
{
	public class DestinoAdapter
	{
		public static Destino Adapt(object[] values)
		{
			IGenericRepository<Empresa> repoEmpresa = new EmpresaRepository();

			return new Destino()
			{
				Id = Guid.Parse(values[(int)Columnas.ID].ToString()),
				Nombre = values[(int)Columnas.NOMBRE].ToString(),
				Empresa = repoEmpresa.GetOne(Guid.Parse(values[(int)Columnas.EMPRESA_ID].ToString())),
				PrefijoInternacional = values[(int)Columnas.PREFIJO_INTERNACIONAL].ToString(),
				Habilitado = bool.Parse(values[(int)Columnas.HABILITADO].ToString())
			};
		}

		private enum Columnas
		{
			ID,
			NOMBRE,
			EMPRESA_ID,
			PREFIJO_INTERNACIONAL,
			HABILITADO
		}
	}
}
