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
	public class PromocionService : IGenericBusinessLogic<Promocion>
	{
		private IGenericRepository<Promocion> repo;

		public PromocionService()
		{
			repo = new PromocionRepository();
		}

		public void Create(Promocion obj)
		{
			repo.Create(obj);
		}

		public IEnumerable<Promocion> GetAll()
		{
			return repo.GetAll();
		}

		public Promocion GetOne(Guid id)
		{
			return repo.GetOne(id);
		}

		public void Remove(Guid id)
		{
			repo.Delete(id);
		}

		public void Update(Promocion obj)
		{
			repo.Update(obj);
		}
	}
}
