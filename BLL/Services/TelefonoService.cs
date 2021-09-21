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
	public class TelefonoService : IGenericBusinessLogic<Telefono>
	{

		private IGenericRepository<Telefono> repo;

		public TelefonoService()
		{
			repo = new TelefonoRepository();
		}

		public void Create(Telefono obj)
		{
			repo.Create(obj);
		}

		public IEnumerable<Telefono> GetAll()
		{
			return repo.GetAll();
		}

		public Telefono GetOne(Guid id)
		{
			return repo.GetOne(id);
		}

		public void Remove(Guid id)
		{
			repo.Delete(id);
		}

		public void Update(Telefono obj)
		{
			throw new NotImplementedException();
		}
	}
}
