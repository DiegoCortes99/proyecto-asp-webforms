using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace pokedex_web
{
	public partial class Registro : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
			try
			{
				//que es lo que vamos a necesitar

				Trainee usuario = new Trainee();
				TraineeNegocio traineeNegocio = new TraineeNegocio();
			
				usuario.Email = txtEmail.Text;
				usuario.Pass = txtContrasenia.Text;
				int id = traineeNegocio.insertarNuevo(usuario);

				EmailService email = new EmailService();
				email.armarCorreo(usuario.Email,"Bienvenida Trainner Pokemon","Hola te damos la Bienvenida al blog sobre Pokemons!! :)");
				email.enviarEmail();

				Response.Redirect("Default.aspx");

			}
			catch (Exception ex)
			{

				Session.Add("Error", ex.ToString());
			}
        }
    }
}