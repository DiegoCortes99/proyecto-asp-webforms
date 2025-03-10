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
    public partial class PokemonsLista : System.Web.UI.Page
    {
        public bool filtroAvanzado { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            filtroAvanzado = chkFiltroAvanzado.Checked;
            if (!IsPostBack)
            {
                PokemonNegocio negocio = new PokemonNegocio();
                Session.Add("pokemonFiltrado", negocio.listarSp());
                dgvPokemons.DataSource = Session["pokemonFiltrado"];
                dgvPokemons.DataBind();
            }

        }

        protected void dgvPokemons_SelectedIndexChanged(object sender, EventArgs e)
        {
            //int id = (int)dgvPokemons.SelectedValue;
            //Response.Redirect($"FormularioPokemon.aspx?id={id}");

            string id = dgvPokemons.SelectedDataKey.Value.ToString();
            Response.Redirect($"FormularioPokemon.aspx?id={id}");
        }

        protected void dgvPokemons_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            dgvPokemons.PageIndex = e.NewPageIndex;

            //Recargar la fuente de datos antes de hacer el DataBind()

            if (Session["pokemonFiltrado"]!=null)
            {
                dgvPokemons.DataSource = Session["pokemonFiltrado"];
                dgvPokemons.DataBind();
            }
        }

        protected void txtFiltroRapido_TextChanged(object sender, EventArgs e)
        {

            // En teoria lo que aqui se hace es guardar un respaldo de los datos de la bd
            List<Pokemon> listaCompleta = (List<Pokemon>)Session["pokemonFiltrado"];

            List<Pokemon> listaFiltrada = listaCompleta.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltroRapido.Text.ToUpper()));

            dgvPokemons.DataSource = listaFiltrada;
            dgvPokemons.DataBind();

        }

        protected void txtFiltrarTipo_TextChanged(object sender, EventArgs e)
        {
            //List<Pokemon> lista = (List<Pokemon>)Session["pokemonFiltrado"];
            //List<Pokemon> listaFiltradaTipo = lista.FindAll(poke => poke.Tipo.Descripcion.ToUpper().Contains(txtFiltrarTipo.Text.ToUpper()));

            //dgvPokemons.DataSource = listaFiltradaTipo;
            //dgvPokemons.DataBind();
        }


        protected void chkFiltroAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            filtroAvanzado = chkFiltroAvanzado.Checked; 
            txtFiltroRapido.Enabled = !filtroAvanzado;
        }

        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCriterio.Items.Clear();
            if (ddlCampo.SelectedItem.ToString() == "Numero")
            {
                ddlCriterio.Items.Add("Mayor a");
                ddlCriterio.Items.Add("Menor a");
                ddlCriterio.Items.Add("Igual");
            }
            else
            {
                ddlCriterio.Items.Add("Comienza con");
                ddlCriterio.Items.Add("Termina con");
                ddlCriterio.Items.Add("Contiene");
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

            try
            {
                PokemonNegocio negocio = new PokemonNegocio();
                dgvPokemons.DataSource = negocio.filtrar(ddlCampo.SelectedItem.ToString(),
                    ddlCriterio.SelectedItem.ToString(), txtFiltroAvanzado.Text, ddlEstado.SelectedItem.ToString());
                dgvPokemons.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}