using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
	public class FacturaDetalle
	{
		public Guid Id { get; set; }
		public FacturaCabecera FacturaCabecera { get; set; }
		public Llamada Llamada { get; set; }
	}
}
