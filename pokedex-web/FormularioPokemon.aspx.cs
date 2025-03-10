using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;


namespace pokedex_web
{
    public partial class FormularioPokemon : System.Web.UI.Page
    {
        public bool confirmarEliminacion { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            txtId.Enabled = false;
            confirmarEliminacion = false;
            try
            {
                if (!IsPostBack)
                {
                    ElementoNegocio elementoNegocio = new ElementoNegocio();

                    List<Elemento> lista = elementoNegocio.listar();

                    ddlTipo.DataSource = lista;
                    ddlTipo.DataValueField = "Id";
                    ddlTipo.DataTextField = "Descripcion";
                    ddlTipo.DataBind();

                    ddlDebilidad.DataSource = lista;
                    ddlDebilidad.DataValueField = "Id";
                    ddlDebilidad.DataTextField = "Descripcion";
                    ddlDebilidad.DataBind();
                }


                //Configuracion si estamos modificando
                if (Request.QueryString["id"] != null && !IsPostBack)
                {
                    PokemonNegocio negocio = new PokemonNegocio();
                    List<Pokemon> lista = negocio.listar(Request.QueryString["id"].ToString());
                    Pokemon seleccionado = lista[0];


                    //guardo pokemon seleccionado en session
                    Session.Add("pokemonSeleccionado",seleccionado);


                    //Pre cargar todos los campos
                    txtId.Text = seleccionado.Id.ToString();
                    txtNumero.Text = seleccionado.Numero.ToString();
                    txtNombre.Text = seleccionado.Nombre;
                    txtDescripcion.Text = seleccionado.Descripcion;
                    txtImagen.Text = seleccionado.UrlImagen;
                    txtImagen_TextChanged(sender, e);

                    ddlTipo.SelectedValue = seleccionado.Tipo.Id.ToString();
                    ddlDebilidad.SelectedValue = seleccionado.Debilidad.Id.ToString();


                    //configurar eventos
                    if (!seleccionado.Activo)
                    {
                        btnInactivar.Text = "Reactivar";
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void txtImagen_TextChanged(object sender, EventArgs e)
        {
            imgPokemon.ImageUrl = txtImagen.Text;
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                // Codigo para agregar
                Pokemon nuevoPokemon = new Pokemon();
                PokemonNegocio negocio = new PokemonNegocio();

                nuevoPokemon.Numero = int.Parse(txtNumero.Text);
                nuevoPokemon.Nombre = txtNombre.Text;

                nuevoPokemon.Tipo = new Elemento();
                nuevoPokemon.Tipo.Id = int.Parse(ddlTipo.SelectedValue);

                nuevoPokemon.Debilidad = new Elemento();
                nuevoPokemon.Debilidad.Id = int.Parse(ddlDebilidad.SelectedValue);

                nuevoPokemon.Descripcion = txtDescripcion.Text;
                nuevoPokemon.UrlImagen = txtImagen.Text;


                if (Request.QueryString["id"] != null)
                {
                    //Para el modificar tenemos que pasarle un id
                    nuevoPokemon.Id = int.Parse(txtId.Text);
                    negocio.modificarConSp(nuevoPokemon);
                }
                else
                {
                    negocio.agregarconSP(nuevoPokemon);
                }

                Response.Redirect("Default.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            confirmarEliminacion = true;
        }

        protected void btnConfirmarEliminacion_Click(object sender, EventArgs e)
        {
            PokemonNegocio negocio = new PokemonNegocio();
            try
            {

            }
            catch (Exception ex)
            {

                throw ex;
            }
            if (chbConfirmarEliminar.Checked)
            {
                negocio.eliminarConSp(int.Parse(Request.QueryString["id"]));
                Response.Redirect("Default.aspx");
            }
        }

        protected void btnInactivar_Click(object sender, EventArgs e)
        {
            PokemonNegocio negocio = new PokemonNegocio();

            try
            {
                Pokemon seleccionado = (Pokemon)Session["pokemonSeleccionado"];

                negocio.eliminarLogicoConSp(seleccionado.Id, !seleccionado.Activo);
                Response.Redirect("PokemonsLista.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}