using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
	public class FacturaCabecera
	{
		public Guid Id { get; set; }
		public Cliente Cliente { get; set; }
		public DateTime FechaFacturacion { get; set; }
		public decimal MontoTotal { get; set; }
		public IEnumerable<FacturaDetalle> facturaDetalles { get; set; }
	}
}
