using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
	public class Promocion
	{
		public Guid Id { get; set; }
		public string Nombre { get; set; }
		public decimal CostoMinuto { get; set; }
		public decimal CostoAdicional { get; set; }
		public bool Habilitado { get; set; }
		public string Enable
		{
			get => Habilitado ? "SI" : "NO";
		}
	}
}
