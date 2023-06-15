﻿using Negocio;
using Opciones;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace RestoApp
{
	public partial class Mesas : System.Web.UI.Page
	{
		public static List<Mesa> mesas;
		public List<Usuario> meseros = new List<Usuario>();
		public Usuario usuario { get; set; }

		protected void Page_Load(object sender, EventArgs e)
		{
			if (Session[Configuracion.Session.Usuario] != null)
				usuario = (Usuario)Session[Configuracion.Session.Usuario];

			// CONTENIDO GERENTE
			if (!IsPostBack && usuario?.Tipo == ColumnasDB.TipoUsuario.Gerente)
			{
				CargarMesas();
				CargarNumeroDeMesasAlDesplegable();
				CargarMesasGuardadas();
				CargarMeseros();
			}

			//CONTENIDO MESERO
			if (!IsPostBack && usuario?.Tipo == ColumnasDB.TipoUsuario.Mesero)
			{
			}
		}

		private void CargarMesas()
		{
			MesaNegocio mesaNegocio = new MesaNegocio();
			mesas = mesaNegocio.Listar();
		}

		//Ponemos el número de mesas de la base de datos en el dropdown
		private void CargarNumeroDeMesasAlDesplegable()
		{
			int numeroMesas = mesas.Count();
			//Mandamos el dato a main.js
			ClientScript.RegisterStartupScript(this.GetType(), "cantidadMesas", $"var cantidadMesas = '{numeroMesas}';", true);
		}

		//Cargamos las mesas Activas
		private void CargarMesasGuardadas()
		{
			//Buscamos mesas activas
			List<Mesa> mesasGuardadas = mesas.FindAll(m => m.Activo == true);

			//Guardamos número de mesa activas
			List<int> numeroMesasGuardas = new List<int>();
			numeroMesasGuardas = mesas.Select(m => m.Activo == true ? m.Numero : 0).ToList();

			// Convierte la lista en una cadena JSON
			var numeroMesasGuardasJSON = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(numeroMesasGuardas);

			//Mandamos el dato a main.js
			ClientScript.RegisterStartupScript(this.GetType(), "numeroMesasGuardas", $"var numeroMesasGuardasJSON = '{numeroMesasGuardasJSON}';", true);

		}

		private void CargarMeseros()
		{
			UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
			meseros = usuarioNegocio.ListarMeseros();

			foreach(Usuario mesero in meseros)
			{
				mesero.Password = null;
			}

			repeaterMeseros.DataSource = meseros;
			repeaterMeseros.DataBind();
		}

		//Obtenemos los datos desde Main.js
		[WebMethod]
		public static void GuardarMesas(int[] array)
		{

			MesaNegocio mesaNegocio = new MesaNegocio();
			for (int i = 0; i < array.Length; i++)
			{
				//Verificar cambios
				if (Mesas.mesas[i].Activo != (array[i] == 1))
					mesaNegocio.ActivarMesasPorNumero(i + 1, array[i]);
			}

		}
	}
}