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
	public class TelefonoRepository : IGenericRepository<Telefono>
	{
		public void Create(Telefono obj)
		{
			SqlHelper.ExecuteNonQuery("TelefonoCreate", CommandType.StoredProcedure,
					new SqlParameter[] { new SqlParameter("@Id", obj.Id),
										new SqlParameter("@Numero", obj.Numero),
										new SqlParameter("@ClienteId", obj.Cliente.Id),
										new SqlParameter("@TelefonoTipoId", obj.TelefonoTipo.Id),
										new SqlParameter("@Habilitado", obj.Habilitado) });
		}

		public void Delete(Guid id)
		{
			SqlHelper.ExecuteNonQuery("TelefonoDelete", CommandType.StoredProcedure,
						new SqlParameter[] { new SqlParameter("@Id", id) });
		}

		public IEnumerable<Telefono> GetAll()
		{
			List<Telefono> telefonos = new List<Telefono>();
			using(var dr = SqlHelper.ExecuteReader("TelefonoGetAll", CommandType.StoredProcedure, null))
			{
				while(dr.Read())
				{
					object[] values = new object[dr.FieldCount];
					dr.GetValues(values);
					telefonos.Add(TelefonoAdapter.Adapt(values));
				}
				dr.Close();
			}
			return telefonos;
		}

		public Telefono GetOne(Guid id)
		{
			Telefono telefono = new Telefono();
			using(var dr = SqlHelper.ExecuteReader("TelefonoGetOne", CommandType.StoredProcedure, new SqlParameter[] { new SqlParameter("@Id", id) }))
			{
				while(dr.Read())
				{
					object[] values = new object[dr.FieldCount];
					dr.GetValues(values);
					telefono = TelefonoAdapter.Adapt(values);
				}
				dr.Close();
			}
			return telefono;

		}

		public void Update(Telefono obj)
		{
			throw new NotImplementedException();
		}
	}
}
