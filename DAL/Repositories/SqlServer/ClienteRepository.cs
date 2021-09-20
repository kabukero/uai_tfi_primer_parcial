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
	public class ClienteRepository : IGenericRepository<Cliente>
	{
		public void Create(Cliente obj)
		{
			SqlHelper.ExecuteNonQuery("ClienteCreate", CommandType.StoredProcedure,
					new SqlParameter[] { new SqlParameter("@Id", obj.Id),
										new SqlParameter("@Nombre", obj.Nombre),
										new SqlParameter("@Apellido", obj.Apellido),
										new SqlParameter("@DNI", obj.DNI),
										new SqlParameter("@Habilitado", obj.Habilitado) });
		}

		public void Delete(Guid id)
		{
			SqlHelper.ExecuteNonQuery("ClienteDelete", CommandType.StoredProcedure,
						new SqlParameter[] { new SqlParameter("@Id", id) });
		}

		public IEnumerable<Cliente> GetAll()
		{
			List<Cliente> clientes = new List<Cliente>();
			using(var dr = SqlHelper.ExecuteReader("ClienteGetAll", CommandType.StoredProcedure, null))
			{
				while(dr.Read())
				{
					object[] values = new object[dr.FieldCount];
					dr.GetValues(values);
					clientes.Add(ClienteAdapter.Adapt(values));
				}
				dr.Close();
			}
			return clientes;
		}

		public Cliente GetOne(Guid id)
		{
			Cliente cliente = default;

			using(var dr = SqlHelper.ExecuteReader("ClienteGetOne", CommandType.StoredProcedure, new SqlParameter[] { new SqlParameter("@Id", id) }))
			{
				if(dr.Read())
				{
					object[] values = new object[dr.FieldCount];
					dr.GetValues(values);
					cliente = ClienteAdapter.Adapt(values);
				}
			}

			return cliente;
		}

		public void Update(Cliente obj)
		{
			SqlHelper.ExecuteNonQuery("ClienteUpdate", CommandType.StoredProcedure,
						new SqlParameter[] { new SqlParameter("@Id", obj.Id),
														new SqlParameter("@Nombre", obj.Nombre),
														new SqlParameter("@Apellido", obj.Apellido),
														new SqlParameter("@DNI", obj.DNI),
														new SqlParameter("@Habilitado", obj.Habilitado) });

		}
	}
}
