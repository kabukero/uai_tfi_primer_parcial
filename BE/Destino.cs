using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
	public class Destino
	{
		public Guid Id { get; set; }
		public string Nombre { get; set; }
		public Empresa Empresa { get; set; }
		public string PrefijoInternacional { get; set; }
		public bool Habilitado { get; set; }
		public string Enable
		{
			get => Habilitado ? "SI" : "NO";
		}
	}
}
