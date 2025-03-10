<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="pokedex_web.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Formulario de Registro</h1>
    <div class="row">
        <div class="col-4">
            <div class="mb-3">
                <asp:Label CssClass="form-label" Text="Correo" runat="server" />
                <asp:TextBox TextMode="Email" CssClass="form-control" runat="server" ID="txtEmail" />
            </div>
            <div class="mb-3">
                <label for="txtContrasenia" class="form-label">Contrasenia</label>
                <asp:TextBox TextMode="Password" CssClass="form-control" runat="server" ID="txtContrasenia" />
            </div>
            <div class="mb-3">
                <asp:Button CssClass="btn btn-primary" ID="btnRegistrarse" OnClick="btnRegistrarse_Click" Text="Registrarse" runat="server" />
                <a href="Default.aspx" class="btn btn-danger">Cancelar</a>
            </div>
        </div>
    </div>
</asp:Content>
