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
	public partial class Detalle : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            try
            {

                if (Request.QueryString["id"] == null)
                {
                    Session["error"] = "Debe seleccionar un Pokémon";
                    Response.Redirect("Error.aspx");
                    return;
                }


                if (!IsPostBack) //IsPostback o postback Representa si la pagina se a cargado por primera vez.
                {
                    int id = int.Parse(Request.QueryString["id"]); // Guardamos con Request.QueryString un id para obtenerlo mediante url.

                    PokemonNegocio negocio = new PokemonNegocio();
                    List<Pokemon> listaCompleta = negocio.listarSp();

                    Pokemon seleccionado = listaCompleta.Find(poke => poke.Id == id);

                    if (seleccionado == null)
                    {
                        Session["error"] = "Pokémon no encontrado";
                        Response.Redirect("Error.aspx");
                        return;
                    }

                    cargarTipo();
                    cargarDebilidad();

                    txtNumero.Text = seleccionado.Numero.ToString();
                    txtNombre.Text = seleccionado.Nombre;
                    txtDescripcion.Text = seleccionado.Descripcion;
                    ddlTipo.SelectedValue = seleccionado.Tipo.Id.ToString();
                    ddlDebilidad.SelectedValue = seleccionado.Debilidad.Id.ToString();
                    imgPokemon.ImageUrl = seleccionado.UrlImagen;
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
            if (Request.QueryString["id"] == null)
            {
                Session["error"] = "Debe seleccionar un Pokémon";
                Response.Redirect("Error.aspx"); // Redirige a una página de error
                return;
            }
        }

        public void cargarTipo()
        {
            ElementoNegocio elementoNegocio = new ElementoNegocio();

            ddlTipo.DataSource = elementoNegocio.listar();
            ddlTipo.DataValueField = "Id";
            ddlTipo.DataTextField = "Descripcion";
            ddlTipo.DataBind();
        }

        public void cargarDebilidad()
        {
            ElementoNegocio elementoNegocio = new ElementoNegocio();

            ddlDebilidad.DataSource = elementoNegocio.listar();
            ddlDebilidad.DataValueField = "Id";
            ddlDebilidad.DataTextField = "Descripcion";
            ddlDebilidad.DataBind();
        }

    }
}