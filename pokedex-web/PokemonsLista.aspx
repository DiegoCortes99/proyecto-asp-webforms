<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PokemonsLista.aspx.cs" Inherits="pokedex_web.PokemonsLista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Lista De Pokemons</h1>

    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <label for="txtFiltroRapido" class="form-label">Filtrar Nombre: </label>
                <asp:TextBox  AutoPostBack="true" OnTextChanged= "txtFiltroRapido_TextChanged" ID="txtFiltroRapido" CssClass="form-control" runat="server" />
            </div>
        </div>
        <div class="col-6" style="display: flex; flex-direction: column; justify-content: flex-end">
            <div class="mb-3">
                <asp:CheckBox AutoPostBack="true" ID="chkFiltroAvanzado" OnCheckedChanged="chkFiltroAvanzado_CheckedChanged" Text="Filtro Avanzado" runat="server" />
            </div>
        </div>

        <%
            if (chkFiltroAvanzado.Checked)
            {
        %>
        <div class="row">
            <div class="col-3">
                <div class="mb-3">
                    <label for="ddlCampo" class="form-label">Campo</label>
                    <asp:DropDownList runat="server" ID="ddlCampo" CssClass="form-control" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Text="Nombre" />
                        <asp:ListItem Text="Numero" />
                        <asp:ListItem Text="Tipo" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-3">
                <div class="mb-3">
                    <label for="ddlCriterio" class="form-label">Criterio</label>
                    <asp:DropDownList runat="server" ID="ddlCriterio" CssClass="form-control">
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-3">
                <div class="mb-3">
                    <label for="txtFiltro" class="form-label">Filtro</label>
                    <asp:TextBox CssClass="form-control" ID="txtFiltroAvanzado" runat="server" />
                </div>
            </div>
            <div class="col-3">
                <div class="mb-3">
                    <asp:Label Text="Estado" runat="server" />
                    <asp:DropDownList runat="server" ID="ddlEstado" CssClass="form-control">
                        <asp:ListItem Text="Todos" />
                        <asp:ListItem Text="Activo" />
                        <asp:ListItem Text="Inactivo" />
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-3">
                <div class="mb-3">
                    <asp:Button Text="Buscar" CssClass="btn btn-primary" ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" />
                </div>
            </div>
        </div>
        <%  }  %>
    </div>
    <asp:GridView CssClass="table table-bordered table-success" ID="dgvPokemons" AutoGenerateColumns="false" runat="server"
        DataKeyNames="Id" OnSelectedIndexChanged="dgvPokemons_SelectedIndexChanged"
        AllowPaging="true" PageSize="4" OnPageIndexChanging="dgvPokemons_PageIndexChanging">
        <Columns>
            <asp:BoundField DataField="Numero" HeaderText="Numero" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
            <asp:BoundField DataField="Tipo.Descripcion" HeaderText="Tipo" />
            <asp:BoundField DataField="Debilidad.Descripcion" HeaderText="Debilidad" />
            <asp:ImageField DataImageUrlField="UrlImagen" HeaderText="Imagen" ControlStyle-Width="150px" />
            <asp:CheckBoxField HeaderText="Activo" DataField="Activo" />
            <asp:CommandField HeaderText="Accion" ShowSelectButton="true" SelectText="✍️" />
            <%--ShowSelectectButton sirve para agregar un tipo boton que envia a una url--%>
            <%--SelecText lo que hace es permitir cambiar el texto del ShowSelectect--%>
        </Columns>
    </asp:GridView>
    <a href="FormularioPokemon.aspx" class="btn btn-primary">Agregar</a>
</asp:Content>
