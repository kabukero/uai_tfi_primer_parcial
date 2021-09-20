using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
	public class Llamada
	{
		public Guid Id { get; set; }
		public Telefono TelefonoOrigen { get; set; }
		public Destino DestinoOrigen { get; set; }
		public Telefono TelefonoDestino { get; set; }
		public Destino DestinoDestino { get; set; }
		public Promocion Promocion { get; set; }
		public int DuracionMinutos { get; set; }
		public DateTime FechaLlamada { get; set; }
	}
}
