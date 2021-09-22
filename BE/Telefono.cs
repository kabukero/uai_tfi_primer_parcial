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
		public Empresa Empresa { get; set; }
		public TelefonoTipo TelefonoTipo { get; set; }
		public bool Habilitado { get; set; }
		public string Enable
		{
			get => Habilitado ? "SI" : "NO";
		}
		public string TelefonoCliente
		{
			get => string.Format("{0} - {1} - {2} - {3}", Numero, Empresa.Nombre, TelefonoTipo.Nombre, Cliente.NombreCompleto);
		}
	}
}
