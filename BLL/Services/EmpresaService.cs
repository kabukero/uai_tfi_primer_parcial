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
	public class EmpresaService : IGenericBusinessLogic<Empresa>
	{
		private IGenericRepository<Empresa> repo;

		public EmpresaService()
		{
			repo = new EmpresaRepository();
		}

		public void Create(Empresa obj)
		{
			repo.Create(obj);
		}

		public IEnumerable<Empresa> GetAll()
		{
			return repo.GetAll();
		}

		public Empresa GetOne(Guid id)
		{
			return repo.GetOne(id);
		}

		public void Remove(Guid id)
		{
			repo.Delete(id);
		}

		public void Update(Empresa obj)
		{
			repo.Update(obj);
		}

	}
}
