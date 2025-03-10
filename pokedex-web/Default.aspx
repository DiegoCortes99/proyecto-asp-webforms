<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="pokedex_web.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Mi Pokedex</h1>

    <div class="row row-cols-1 row-cols-md-3 g-4">

    <%
        foreach (dominio.Pokemon poke in ListaPokemon) // EL DOMINIO.POKEMON crea un objeto el cual nos permite
                                                       // interactuar dentro del foreach con los datos de pokemon.
        {
    %>
            <div class="col">
                <div class="card">
                    <img src="<%:poke.UrlImagen %>" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title"><%:  poke.Nombre  %></h5>
                        <p class="card-text"><%:poke.Descripcion %></p>
                        <a href="Detalle.aspx?id=<%: poke.Id %> ">Ver Detalle</a>
                    </div>
                </div>
             </div>

      <%  } %>


    </div>
</asp:Content>
