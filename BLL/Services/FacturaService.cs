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
	public class FacturaService : IGenericBusinessLogic<FacturaCabecera>
	{
		private IGenericRepository<FacturaCabecera> repo;
		private IGenericRepository<Llamada> repoLlamada;

		public FacturaService()
		{
			repo = new FacturaRepository();
			repoLlamada = new LlamadaRepository();
		}

		public void Create(FacturaCabecera obj)
		{
			var llamadas = repoLlamada.GetAll().
								Where(x => x.FechaLlamada.Month == obj.FechaFacturacion.Month
								&& x.TelefonoOrigen.Cliente.Id == obj.Cliente.Id);

			var detalles = new List<FacturaDetalle>();
			foreach(Llamada llamada in llamadas)
			{
				detalles.Add(new FacturaDetalle()
				{
					Id = Guid.NewGuid(),
					FacturaCabecera = obj,
					Llamada = llamada
				});
			}

			obj.facturaDetalles = detalles;
			obj.MontoTotal = llamadas.Sum(x => x.Importe) + 1000;

			repo.Create(obj);
		}

		public IEnumerable<FacturaCabecera> GetAll()
		{
			return repo.GetAll();
		}

		public FacturaCabecera GetOne(Guid id)
		{
			throw new NotImplementedException();
		}

		public void Remove(Guid id)
		{
			throw new NotImplementedException();
		}

		public void Update(FacturaCabecera obj)
		{
			throw new NotImplementedException();
		}
	}
}
