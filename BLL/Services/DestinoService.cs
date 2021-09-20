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
	public class DestinoService : IGenericBusinessLogic<Destino>
	{
		private IGenericRepository<Destino> repo;

		public DestinoService()
		{
			repo = new DestinoRepository();
		}

		public void Create(Destino obj)
		{
			repo.Create(obj);
		}

		public IEnumerable<Destino> GetAll()
		{
			return repo.GetAll();
		}

		public Destino GetOne(Guid id)
		{
			return repo.GetOne(id);
		}

		public void Remove(Guid id)
		{
			repo.Delete(id);
		}

		public void Update(Destino obj)
		{
			repo.Update(obj);
		}
	}
}
