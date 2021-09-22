using BE;
using DAL.Repositories.SqlServer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Services
{
	public class ReporteService
	{
		public IEnumerable<ReporteCargosMesCliente> GetReporteCargosMesCliente(Cliente cliente, Mes mes)
		{
			return (new ReporteRepository()).GetReporteCargosMesCliente(cliente, mes);
		}

		public IEnumerable<ReporteRecaudacionTotalMes> GetReporteRecTotalMes(Mes mes)
		{
			return (new ReporteRepository()).GetReporteRecTotalMes(mes);
		}

		public IEnumerable<ReporteRecMesPromocion> GetReporteRecMesPromocion(Promocion promocion, Mes mes)
		{
			return (new ReporteRepository()).GetReporteRecMesPromocion(promocion, mes);
		}
		
		public IEnumerable<ReportePorcentajeLlamadasTipoGeneralCliente> GetReportePorcentajeLlamadasTipoGeneralCliente(Cliente cliente)
		{
			return (new ReporteRepository()).GetReportePorcentajeLlamadasTipoGeneralCliente(cliente);
		}
	}
}
