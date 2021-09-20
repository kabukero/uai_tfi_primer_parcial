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
	public class TelefonoTipoRepository : IGenericRepository<TelefonoTipo>
	{
		public void Create(TelefonoTipo obj)
		{
			throw new NotImplementedException();
		}

		public void Delete(Guid id)
		{
			throw new NotImplementedException();
		}

		public IEnumerable<TelefonoTipo> GetAll()
		{
			List<TelefonoTipo> tipos = new List<TelefonoTipo>();
			using(var dr = SqlHelper.ExecuteReader("TelefonoTipoGetAll", CommandType.StoredProcedure, null))
			{
				while(dr.Read())
				{
					object[] values = new object[dr.FieldCount];
					dr.GetValues(values);
					tipos.Add(TelefonoTipoAdapter.Adapt(values));
				}
				dr.Close();
			}
			return tipos;
		}

		public TelefonoTipo GetOne(Guid id)
		{
			TelefonoTipo tipo = default;

			using(var dr = SqlHelper.ExecuteReader("TelefonoTipoGetOne", CommandType.StoredProcedure, new SqlParameter[] { new SqlParameter("@Id", id) }))
			{
				if(dr.Read())
				{
					object[] values = new object[dr.FieldCount];
					dr.GetValues(values);
					tipo = TelefonoTipoAdapter.Adapt(values);
				}
			}

			return tipo;
		}

		public void Update(TelefonoTipo obj)
		{
			throw new NotImplementedException();
		}
	}
}
