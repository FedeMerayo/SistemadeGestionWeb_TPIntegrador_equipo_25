﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Opciones
{
	public class Configuracion
	{
		public struct Pagina
		{
			public const string Login = "Default.aspx";
			public const string Main = "Main.aspx";
			public const string Perfil = "Perfil.aspx";
		}

		public struct Session
		{
			public const string Usuario = "usuario";
			public const string MeseroPorDia = "MeseroPorDia";
			public const string MeserosNoAsignados = "MeserosNoAsignados";
			public const string MeserosAsignados = "MeserosAsignados";
			public const string Error = "error";
		}
	}
}
