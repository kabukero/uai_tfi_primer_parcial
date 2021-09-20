using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
	public class Telefono
	{
		public Guid Id { get; set; }
		public string Numero { get; set; }
		public Cliente Cliente { get; set; }
		public TelefonoTipo TelefonoTipo { get; set; }
		public bool Habilitado { get; set; }
		public string Enable
		{
			get => Habilitado ? "SI" : "NO";
		}
	}
}
