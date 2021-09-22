using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
	public class ReporteCargosMesCliente
	{
		public Cliente Cliente { get; set; }
		public Mes Mes { get; set; }
		public Decimal Importe { get; set; }
	}
}
