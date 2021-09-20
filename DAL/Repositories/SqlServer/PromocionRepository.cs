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
	public class PromocionRepository : IGenericRepository<Promocion>
	{
		public void Create(Promocion obj)
		{
			SqlHelper.ExecuteNonQuery("PromocionCreate", CommandType.StoredProcedure,
					new SqlParameter[] { new SqlParameter("@Id", obj.Id),
										new SqlParameter("@Nombre", obj.Nombre),
										new SqlParameter("@CostoMinuto", obj.CostoMinuto),
										new SqlParameter("@CostoAdicional", obj.CostoAdicional),
										new SqlParameter("@Habilitado", obj.Habilitado) });
		}

		public void Delete(Guid id)
		{
			SqlHelper.ExecuteNonQuery("PromocionDelete", CommandType.StoredProcedure,
						new SqlParameter[] { new SqlParameter("@Id", id) });
		}

		public IEnumerable<Promocion> GetAll()
		{
			List<Promocion> promociones = new List<Promocion>();
			using(var dr = SqlHelper.ExecuteReader("PromocionGetAll", CommandType.StoredProcedure, null))
			{
				while(dr.Read())
				{
					object[] values = new object[dr.FieldCount];
					dr.GetValues(values);
					promociones.Add(PromocionAdapter.Adapt(values));
				}
				dr.Close();
			}
			return promociones;
		}

		public Promocion GetOne(Guid id)
		{
			Promocion promocion = default;

			using(var dr = SqlHelper.ExecuteReader("PromocionGetOne", CommandType.StoredProcedure, new SqlParameter[] { new SqlParameter("@Id", id) }))
			{
				if(dr.Read())
				{
					object[] values = new object[dr.FieldCount];
					dr.GetValues(values);
					promocion = PromocionAdapter.Adapt(values);
				}
			}

			return promocion;
		}

		public void Update(Promocion obj)
		{
			SqlHelper.ExecuteNonQuery("PromocionUpdate", CommandType.StoredProcedure,
						new SqlParameter[] { new SqlParameter("@Id", obj.Id),
											new SqlParameter("@Nombre", obj.Nombre),
											new SqlParameter("@CostoMinuto", obj.CostoMinuto),
											new SqlParameter("@CostoAdicional", obj.CostoAdicional),
											new SqlParameter("@Habilitado", obj.Habilitado) });

		}
	}
}
