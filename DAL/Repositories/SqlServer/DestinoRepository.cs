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
	public class DestinoRepository : IGenericRepository<Destino>
	{
		public void Create(Destino obj)
		{
			SqlHelper.ExecuteNonQuery("DestinoCreate", CommandType.StoredProcedure,
					new SqlParameter[] { new SqlParameter("@Id", obj.Id),
										new SqlParameter("@Nombre", obj.Nombre),
										new SqlParameter("@EmpresaId", obj.Empresa.Id),
										new SqlParameter("@PrefijoInternacional", obj.PrefijoInternacional),
										new SqlParameter("@Habilitado", obj.Habilitado) });
		}

		public void Delete(Guid id)
		{
			SqlHelper.ExecuteNonQuery("DestinoDelete", CommandType.StoredProcedure,
						new SqlParameter[] { new SqlParameter("@Id", id) });
		}

		public IEnumerable<Destino> GetAll()
		{
			List<Destino> empresas = new List<Destino>();
			using(var dr = SqlHelper.ExecuteReader("DestinoGetAll", CommandType.StoredProcedure, null))
			{
				while(dr.Read())
				{
					object[] values = new object[dr.FieldCount];
					dr.GetValues(values);
					empresas.Add(DestinoAdapter.Adapt(values));
				}
				dr.Close();
			}
			return empresas;
		}

		public Destino GetOne(Guid id)
		{
			Destino empresa = default;

			using(var dr = SqlHelper.ExecuteReader("DestinoGetOne", CommandType.StoredProcedure, new SqlParameter[] { new SqlParameter("@Id", id) }))
			{
				if(dr.Read())
				{
					object[] values = new object[dr.FieldCount];
					dr.GetValues(values);
					empresa = DestinoAdapter.Adapt(values);
				}
			}

			return empresa;
		}

		public void Update(Destino obj)
		{
			SqlHelper.ExecuteNonQuery("DestinoUpdate", CommandType.StoredProcedure,
						new SqlParameter[] { new SqlParameter("@Id", obj.Id),
											new SqlParameter("@Nombre", obj.Nombre),
											new SqlParameter("@EmpresaId", obj.Empresa.Id),
											new SqlParameter("@PrefijoInternacional", obj.PrefijoInternacional),
											new SqlParameter("@Habilitado", obj.Habilitado) });

		}
	}
}
