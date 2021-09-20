using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Cliente
    {
		public Guid Id { get; set; }
		public string Nombre { get; set; }
		public string Apellido { get; set; }
		public string DNI { get; set; }
		public bool Habilitado { get; set; }
		public string Enable
		{
			get => Habilitado ? "SI" : "NO";
		}

		public string NombreCompleto
		{
			get => string.Format("{0} {1}", Nombre, Apellido);
		}

		public Cliente()
		{

		}

		public Cliente(Guid id, string nombre, string apellido, string dni, bool habilitado)
		{
			Id = id;
			Nombre = nombre;
			Apellido = apellido;
			DNI = dni;
			Habilitado = habilitado;
		}
	}
}
