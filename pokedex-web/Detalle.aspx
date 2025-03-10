<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="pokedex_web.Detalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Detalles</h1>

    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <label for="txtNumero" class="form-label">Numero: </label>
                <asp:TextBox ID="txtNumero" TextMode="Number" CssClass="form-control" runat="server" />
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre: </label>
                <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server" />
            </div>
            <div class="mb-3">
                <label for="Descripcion" class="form-label">Descripcion: </label>
                <asp:TextBox TextMode="MultiLine" ID="txtDescripcion" CssClass="form-control" runat="server" />
            </div>
            <div class="mb-3">
                <label for="ddlTipo" class="form-label">Tipo: </label>
                <asp:DropDownList DataValueField="Id" DataTextField="Descripcion" ID="ddlTipo" CssClass="form-control" runat="server" />
            </div>
            <div class="mb-3">
                <label for="ddlDebilidad" class="form-label">Debilidad: </label>
                <asp:DropDownList ID="ddlDebilidad" CssClass="form-control" runat="server" />
            </div>
        </div>
        <div class="col-6">
            <div class="mb-3">
                <label for="imgPokemon" class="form-label">Imagen: </label>
                <asp:Image ID="imgPokemon" CssClass="form-control" runat="server" Width="450px" />
            </div>
        </div>
    </div>
















    <%--<div class="row">
        <div class="col-6">
            <div class="mb-3">
                <label for="txtNumero" class="form-label">Numero</label>
                <asp:TextBox ID="txtNumero" TextMode="Number" CssClass="form-control" runat="server" />
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server" />
            </div>
            <div class="mb-3">
                <label for="Descripcion" class="form-label">Descripcion</label>
                <asp:TextBox ID="txtDescripcion" CssClass="form-control" runat="server" />
            </div>
         </div>
    </div>--%>
</asp:Content>
