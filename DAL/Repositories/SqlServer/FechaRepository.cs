using BE;
using DAL.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repositories
{
	public class FechaRepository
	{
		public IEnumerable<Mes> GetAll()
		{
			return new List<Mes>()
			{
				new Mes() { Numero = 1, Nombre = "Enero" },
				new Mes() { Numero = 2, Nombre = "Febrero" },
				new Mes() { Numero = 3, Nombre = "Marzo" },
				new Mes() { Numero = 4, Nombre = "Abril" },
				new Mes() { Numero = 5, Nombre = "Mayo" },
				new Mes() { Numero = 6, Nombre = "Junio" },
				new Mes() { Numero = 7, Nombre = "Julio" },
				new Mes() { Numero = 8, Nombre = "Agosto" },
				new Mes() { Numero = 9, Nombre = "Septiembre" },
				new Mes() { Numero = 10, Nombre = "Octubre" },
				new Mes() { Numero = 11, Nombre = "Noviembre" },
				new Mes() { Numero = 12, Nombre = "Diciembre" }
			};
		}

		public Mes GetOne(int id)
		{
			return GetAll().FirstOrDefault(x => x.Numero == id);
		}
	}
}
