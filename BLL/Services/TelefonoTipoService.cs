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
	public class TelefonoTipoService : IGenericBusinessLogic<TelefonoTipo>
	{
		private IGenericRepository<TelefonoTipo> repo;

		public TelefonoTipoService()
		{
			repo = new TelefonoTipoRepository();
		}

		public void Create(TelefonoTipo obj)
		{
			throw new NotImplementedException();
		}

		public IEnumerable<TelefonoTipo> GetAll()
		{
			return repo.GetAll();
		}

		public TelefonoTipo GetOne(Guid id)
		{
			throw new NotImplementedException();
		}

		public void Remove(Guid id)
		{
			throw new NotImplementedException();
		}

		public void Update(TelefonoTipo obj)
		{
			throw new NotImplementedException();
		}
	}
}
