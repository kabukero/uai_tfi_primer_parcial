using BE;
using BLL.Contracts;
using DAL.Contracts;
using DAL.Repositories.SqlServer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Services
{
	public class ClienteService : IGenericBusinessLogic<Cliente>
	{
		private IGenericRepository<Cliente> repo;

		public ClienteService()
		{
			repo = new ClienteRepository();
		}

		public void Create(Cliente obj)
		{
			repo.Create(obj);
		}

		public IEnumerable<Cliente> GetAll()
		{
			return repo.GetAll();
		}

		public Cliente GetOne(Guid id)
		{
			return repo.GetOne(id);
		}

		public void Remove(Guid id)
		{
			repo.Delete(id);
		}

		public void Update(Cliente obj)
		{
			repo.Update(obj);
		}
	}
}
