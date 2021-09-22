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
	public class FacturaRepository : IGenericRepository<FacturaCabecera>
	{
		public void Create(FacturaCabecera obj)
		{
			SqlHelper.ExecuteNonQuery("FacturaCabeceraCreate", CommandType.StoredProcedure,
					new SqlParameter[] { new SqlParameter("@Id", obj.Id),
										new SqlParameter("@ClienteId", obj.Cliente.Id),
										new SqlParameter("@FechaFacturacion", obj.FechaFacturacion.ToString("yyyy/MM/dd")),
										new SqlParameter("@MontoTotal", obj.MontoTotal) });

			foreach(FacturaDetalle detalle in obj.facturaDetalles)
			{
				SqlHelper.ExecuteNonQuery("FacturaDetalleCreate", CommandType.StoredProcedure,
					new SqlParameter[] { new SqlParameter("@Id", detalle.Id),
										new SqlParameter("@FacturaCabeceraId", detalle.FacturaCabecera.Id),
										new SqlParameter("@LlamadaId", detalle.Llamada.Id) });
			}
		}

		public void Delete(Guid id)
		{
			throw new NotImplementedException();
		}

		public IEnumerable<FacturaCabecera> GetAll()
		{
			List<FacturaCabecera> facturas = new List<FacturaCabecera>();
			using(var dr = SqlHelper.ExecuteReader("FacturaCabeceraGetAll", CommandType.StoredProcedure, null))
			{
				while(dr.Read())
				{
					object[] values = new object[dr.FieldCount];
					dr.GetValues(values);
					facturas.Add(FacturaAdapter.Adapt(values));
				}
				dr.Close();
			}
			return facturas;
		}

		public FacturaCabecera GetOne(Guid id)
		{
			throw new NotImplementedException();
		}

		public void Update(FacturaCabecera obj)
		{
			throw new NotImplementedException();
		}
	}
}
