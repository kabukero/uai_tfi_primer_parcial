using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
	public class ReportePorcentajeLlamadasTipoGeneralCliente
	{
		public Cliente Cliente { get; set; }
		public Promocion Promocion { get; set; }
		public int Cantidad { get; set; }
		public Decimal Porcentaje { get; set; }
	}
}
