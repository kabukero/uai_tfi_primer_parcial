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
	public class LlamadaService : IGenericBusinessLogic<Llamada>
	{
		private IGenericRepository<Llamada> repo;
		private IGenericRepository<Promocion> repoPromocion;

		public LlamadaService()
		{
			repo = new LlamadaRepository();
			repoPromocion = new PromocionRepository();
		}

		public void Create(Llamada obj)
		{
			var promocion = repoPromocion.GetOne(obj.Promocion.Id);
			obj.Importe = obj.DuracionMinutos * promocion.CostoMinuto + promocion.CostoAdicional;
			repo.Create(obj);
		}

		public IEnumerable<Llamada> GetAll()
		{
			return repo.GetAll();
		}

		public Llamada GetOne(Guid id)
		{
			throw new NotImplementedException();
		}

		public void Remove(Guid id)
		{
			throw new NotImplementedException();
		}

		public void Update(Llamada obj)
		{
			throw new NotImplementedException();
		}
	}
}
