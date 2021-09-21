using BE;
using DAL.Contracts;
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
	public class LlamadaRepository : IGenericRepository<Llamada>
	{
		public void Create(Llamada obj)
		{
			SqlHelper.ExecuteNonQuery("LLamadaCreate", CommandType.StoredProcedure,
					new SqlParameter[] { new SqlParameter("@Id", obj.Id),
										new SqlParameter("@TelefonoOrigenId", obj.TelefonoOrigen.Id),
										new SqlParameter("@DestinoOrigenId", obj.DestinoOrigen.Id),
										new SqlParameter("@TelefonoDestinoId", obj.TelefonoDestino.Id),
										new SqlParameter("@DestinoDestinoId", obj.DestinoDestino.Id),
										new SqlParameter("@DuracionMinutos", obj.DuracionMinutos),
										new SqlParameter("@PromocionId", obj.Promocion.Id),
										new SqlParameter("@FechaLlamada", obj.FechaLlamada.ToString("yyyy/MM/dd"))
					});
		}

		public void Delete(Guid id)
		{
			throw new NotImplementedException();
		}

		public IEnumerable<Llamada> GetAll()
		{
			List<Llamada> lLamadas = new List<Llamada>();
			using(var dr = SqlHelper.ExecuteReader("LLamadaGetAll", CommandType.StoredProcedure, null))
			{
				while(dr.Read())
				{
					object[] values = new object[dr.FieldCount];
					dr.GetValues(values);
					lLamadas.Add(LLamadaAdapter.Adapt(values));
				}
				dr.Close();
			}
			return lLamadas;
		}

		public Llamada GetOne(Guid id)
		{
			throw new NotImplementedException();
		}

		public void Update(Llamada obj)
		{
			throw new NotImplementedException();
		}
	}
}
