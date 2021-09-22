using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
	public class Empresa
	{
		public Guid Id { get; set; }
		public string Nombre { get; set; }
		public bool Habilitado { get; set; }
		public string Enable
		{
			get => Habilitado ? "SI" : "NO";
		}

		public IEnumerable<Telefono> Telefonos { get; set; }
		public IEnumerable<Destino> Destinos { get; set; }
	}
}
