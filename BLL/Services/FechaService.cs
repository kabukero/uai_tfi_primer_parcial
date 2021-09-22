using BE;
using BLL.Contracts;
using DAL.Contracts;
using DAL.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Services
{
	public class FechaService
	{

		private FechaRepository repo;

		public FechaService()
		{
			repo = new FechaRepository();
		}

		public IEnumerable<Mes> GetAll()
		{
			return repo.GetAll();
		}

		public Mes GetOne(int id)
		{
			return repo.GetOne(id);
		}
	}
}
