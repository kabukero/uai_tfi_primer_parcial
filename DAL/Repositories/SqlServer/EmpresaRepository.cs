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
	public class EmpresaRepository : IGenericRepository<Empresa>
	{
		public void Create(Empresa obj)
		{
			SqlHelper.ExecuteNonQuery("EmpresaCreate", CommandType.StoredProcedure,
					new SqlParameter[] { new SqlParameter("@Id", obj.Id),
										new SqlParameter("@Nombre", obj.Nombre),
										new SqlParameter("@Habilitado", obj.Habilitado) });
		}

		public void Delete(Guid id)
		{
			SqlHelper.ExecuteNonQuery("EmpresaDelete", CommandType.StoredProcedure,
						new SqlParameter[] { new SqlParameter("@Id", id) });
		}

		public IEnumerable<Empresa> GetAll()
		{
			List<Empresa> empresas = new List<Empresa>();
			using(var dr = SqlHelper.ExecuteReader("EmpresaGetAll", CommandType.StoredProcedure, null))
			{
				while(dr.Read())
				{
					object[] values = new object[dr.FieldCount];
					dr.GetValues(values);
					empresas.Add(EmpresaAdapter.Adapt(values));
				}
				dr.Close();
			}
			return empresas;
		}

		public Empresa GetOne(Guid id)
		{
			Empresa empresa = default;

			using(var dr = SqlHelper.ExecuteReader("EmpresaGetOne", CommandType.StoredProcedure, new SqlParameter[] { new SqlParameter("@Id", id) }))
			{
				if(dr.Read())
				{
					object[] values = new object[dr.FieldCount];
					dr.GetValues(values);
					empresa = EmpresaAdapter.Adapt(values);
				}
			}

			return empresa;
		}

		public void Update(Empresa obj)
		{
			SqlHelper.ExecuteNonQuery("EmpresaUpdate", CommandType.StoredProcedure,
						new SqlParameter[] { new SqlParameter("@Id", obj.Id),
											new SqlParameter("@Nombre", obj.Nombre),
											new SqlParameter("@Habilitado", obj.Habilitado) });

		}
	}
}
