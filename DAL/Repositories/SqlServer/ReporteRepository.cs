using BE;
using DAL.Helpers;
using DAL.Repositories.SqlServer.Adapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repositories.SqlServer
{
	public class ReporteRepository
	{
		public IEnumerable<ReporteCargosMesCliente> GetReporteCargosMesCliente(Cliente cliente, Mes mes)
		{
			List<ReporteCargosMesCliente> reporte = new List<ReporteCargosMesCliente>();
			using(var dr = SqlHelper.ExecuteReader("ReporteCargosMesCliente", CommandType.StoredProcedure,
										new SqlParameter[] { new SqlParameter("@ClienteId", cliente.Id),
										new SqlParameter("@Mes", mes.Numero) }))
			{
				while(dr.Read())
				{
					object[] values = new object[dr.FieldCount];
					dr.GetValues(values);
					reporte.Add(ReporteCargosMesClienteAdapter.Adapt(values));
				}
				dr.Close();
			}
			return reporte;
		}

		public IEnumerable<ReporteRecaudacionTotalMes> GetReporteRecTotalMes(Mes mes)
		{
			List<ReporteRecaudacionTotalMes> reporte = new List<ReporteRecaudacionTotalMes>();
			using(var dr = SqlHelper.ExecuteReader("ReporteRecTotalMes", CommandType.StoredProcedure,
										new SqlParameter[] { new SqlParameter("@Mes", mes.Numero) }))
			{
				while(dr.Read())
				{
					object[] values = new object[dr.FieldCount];
					dr.GetValues(values);
					reporte.Add(ReporteRecaudacionTotalMesAdapter.Adapt(values));
				}
				dr.Close();
			}
			return reporte;
		}

		public IEnumerable<ReporteRecMesPromocion> GetReporteRecMesPromocion(Promocion promocion, Mes mes)
		{
			List<ReporteRecMesPromocion> reporte = new List<ReporteRecMesPromocion>();
			using(var dr = SqlHelper.ExecuteReader("ReporteRecMesPromocion", CommandType.StoredProcedure,
										new SqlParameter[] { new SqlParameter("@PromocionId", promocion.Id),
										new SqlParameter("@Mes", mes.Numero) }))
			{
				while(dr.Read())
				{
					object[] values = new object[dr.FieldCount];
					dr.GetValues(values);
					reporte.Add(ReporteRecMesPromocionMesAdapter.Adapt(values));
				}
				dr.Close();
			}
			return reporte;
		}

		public IEnumerable<ReportePorcentajeLlamadasTipoGeneralCliente> GetReportePorcentajeLlamadasTipoGeneralCliente(Cliente cliente)
		{
			List<ReportePorcentajeLlamadasTipoGeneralCliente> reporte = new List<ReportePorcentajeLlamadasTipoGeneralCliente>();
			using(var dr = SqlHelper.ExecuteReader("ReportePorcentajeLlamadasTipoGeneralCliente", CommandType.StoredProcedure,
										new SqlParameter[] { new SqlParameter("@ClienteId", cliente.Id) }))
			{
				while(dr.Read())
				{
					object[] values = new object[dr.FieldCount];
					dr.GetValues(values);
					reporte.Add(ReportePorcentajeLlamadasTipoGeneralClienteAdapter.Adapt(values));
				}
				dr.Close();
			}
			return reporte;
		}
	}
}
