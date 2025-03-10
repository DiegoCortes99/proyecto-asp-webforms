<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FormularioPokemon.aspx.cs" Inherits="pokedex_web.FormularioPokemon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <h1>Formulario de Pokemons</h1>
    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <label for="txtId" class="form-label">Id: </label>
                <asp:TextBox ID="txtId" TextMode="Number" CssClass="form-control" runat="server" />
            </div>
            <div class="mb-3">
                <label for="txtNumero" class="form-label">Numero: </label>
                <asp:TextBox ID="txtNumero" TextMode="Number" CssClass="form-control" runat="server" />
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre: </label>
                <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server" />
            </div>
            <div class="mb-3">
                <label for="ddlTipo" class="form-label">Tipo: </label>
                <asp:DropDownList ID="ddlTipo" CssClass="form-control" runat="server" />
            </div>
            <div class="mb-3">
                <label for="ddlDebilidad" class="form-label">Debilidad: </label>
                <asp:DropDownList ID="ddlDebilidad" DataTextField="Descripcion" DataValueField="Id" CssClass="form-control" runat="server" />
            </div>
            <asp:Button CssClass="btn btn-primary" ID="btnAceptar" Text="Aceptar" runat="server" OnClick="btnAceptar_Click" />
            <a href="PokemonsLista.aspx" class="btn btn-danger">Volver</a>
        </div>
        <div class="col-6">
            <div class="mb-3">
                <label for="Descripcion" class="form-label">Descripcion: </label>
                <asp:TextBox TextMode="MultiLine" ID="txtDescripcion" CssClass="form-control" runat="server" />
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <label for="txtImagen" class="form-label">Url Imagen: </label>
                        <asp:TextBox AutoPostBack="true" OnTextChanged="txtImagen_TextChanged" ID="txtImagen" CssClass="form-control" runat="server" />
                    </div>
                    <asp:Image ID="imgPokemon" ImageUrl="https://images.ctfassets.net/ihx0a8chifpc/GTlzd4xkx4LmWsG1Kw1BB/ad1834111245e6ee1da4372f1eb5876c/placeholder.com-1280x720.png?w=1920&q=60&fm=webp" Width="400px" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="row">
            <div class="col-6">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="mb-3">
                            <asp:Button CssClass="btn btn-danger" ID="btnEliminar" Text="Eliminar" runat="server" OnClick="btnEliminar_Click"/>
                            <asp:Button CssClass="btn btn-warning" ID="btnInactivar" Text="Inactivar" runat="server" OnClick="btnInactivar_Click"/>
                        </div>
                        
                            <%
                            if (confirmarEliminacion)
                            {
                            %>
                                <asp:CheckBox Text="Confirmar Eliminacion" runat="server" ID="chbConfirmarEliminar" />
                                <asp:Button CssClass="btn btn-danger" ID="btnConfirmarEliminacion" Text="Eliminar 100%" runat="server" OnClick="btnConfirmarEliminacion_Click" />

                        <%  } %>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
