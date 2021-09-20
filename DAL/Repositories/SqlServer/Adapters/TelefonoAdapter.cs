using BE;
using DAL.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repositories.SqlServer.Adapters
{
	internal class TelefonoAdapter
	{
		public static Telefono Adapt(object[] values)
		{
			IGenericRepository<Cliente> repoCliente = new ClienteRepository();
			IGenericRepository<TelefonoTipo> repoTelefonoTipo = new TelefonoTipoRepository();

			return new Telefono()
			{
				Id = Guid.Parse(values[(int)Columnas.ID].ToString()),
				Numero = values[(int)Columnas.NUMERO].ToString(),
				Cliente = repoCliente.GetOne(Guid.Parse(values[(int)Columnas.CLIENTE_ID].ToString())),
				TelefonoTipo = repoTelefonoTipo.GetOne(Guid.Parse(values[(int)Columnas.TELEFONO_TIPO_ID].ToString())),
				Habilitado = bool.Parse(values[(int)Columnas.HABILITADO].ToString())
			};
		}

		private enum Columnas
		{
			ID,
			NUMERO,
			TELEFONO_TIPO_ID,
			CLIENTE_ID,
			HABILITADO
		}
	}
}
